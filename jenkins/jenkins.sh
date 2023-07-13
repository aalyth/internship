#!/bin/sh

sudo systemctl start docker

:'
# this way we configure the Docker API to be open to localhost:4243
sudo sed -i 's/^ExecStart=.*/ExecStart=\/usr\/bin\/dockerd -H tcp:\/\/0\.0\.0\.0:4243 -H unix:\/\/\/var\/run\/docker\.sock/' /lib/systemd/system/docker.service

sudo systemctl daemon-reload
sudo systemctl restart docker.service
'

private_ip=$(hostname -I | awk '{print $1}')

docker_uri="\"tcp://${private_ip}:4243/\""

yq -i ".jenkins.clouds[0].docker.dockerApi.dockerHost.uri = ${docker_uri}" casc.yaml


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

java -jar jenkins-cli.jar -s $JENKINS_URL create-job 'ci' < ./jobs/ci.xml

rm jenkins-cli.jar


# this is so the jenkins is visible to the outside world
echo "Starting Ngrok port forward...\n"
killall ngrok 2>/dev/null
ngrok http 8080 > /dev/null &

# so the ngrok loads
sleep 5 

tunnel_url=$(curl -s http://localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url')

echo "Connect your Jenkins to the given link: $tunnel_url\n"

