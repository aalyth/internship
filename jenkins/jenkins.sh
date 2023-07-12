#!/bin/sh

sudo systemctl start docker

:'
# this way we configure the Docker API to be open to localhost:4243
sudo sed -i 's/^ExecStart=.*/ExecStart=\/usr\/bin\/dockerd -H tcp:\/\/0\.0\.0\.0:4243 -H unix:\/\/\/var\/run\/docker\.sock/' /lib/systemd/system/docker.service

sudo systemctl daemon-reload
sudo systemctl restart docker.service
'

# JCasC - Jenkins Configuration as Code
docker image rm jenkins:jcasc
docker build -t jenkins:jcasc .

docker compose down jenkins
docker compose up -d

JENKINS_URL='http://localhost:8080'

echo "\nAwaiting Jenkins start...\n"
until $(curl --output /dev/null --silent --head --fail $JENKINS_URL); do
    sleep 2
done

rm jenkins-cli.jar
wget http://localhost:8080/jnlpJars/jenkins-cli.jar -o /dev/null

java -jar jenkins-cli.jar -s $JENKINS_URL create-job 'internship' < ./jobs/internship.xml

rm jenkins-cli.jar


# this is so the jenkins is visible to the outside world
echo "Starting Ngrok port forward...\n"
killall ngrok 2>/dev/null
ngrok http 8080 > /dev/null &

# so the ngrok loads
sleep 5 

tunnel_url=$(curl -s http://localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url')

echo "Connect your GitHub WebHook to the given link: $tunnel_url/github-webhook/\n"

# !!! you need to add your own GitHub Credentials in the Dashboard > Manage Jenkins > System

# install the docker plugin
# you need to port forward the jenkins webhook so github can access it
