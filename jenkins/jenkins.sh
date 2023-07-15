#!/bin/sh

#echo "\nSetting up Docker & Docker Daemon...\n"
#sudo systemctl start docker
#
## this way we configure the Docker API to be open to localhost:4243
#sudo sed -i 's/^ExecStart=.*/ExecStart=\/usr\/bin\/dockerd -H tcp:\/\/0\.0\.0\.0:4243 -H unix:\/\/\/var\/run\/docker\.sock/' /lib/systemd/system/docker.service
#
#sudo systemctl daemon-reload
#sudo systemctl restart docker.service

PRIVATE_IP=$(hostname -I | awk '{print $1}')
DOCKER_URI="\"tcp://${PRIVATE_IP}:4243/\""
yq -i ".jenkins.clouds[0].docker.dockerApi.dockerHost.uri = ${DOCKER_URI}" casc.yaml

# JCasC - Jenkins Configuration as Code
docker compose down jenkins
docker image rm jenkins:jcasc

docker build -t jenkins:jcasc .
docker compose up -d

JENKINS_URL='http://localhost:8080'

echo "\nAwaiting Jenkins start..."
until $(curl --output /dev/null --silent --head --fail $JENKINS_URL); do
    sleep 1
done

echo "\nImporting Jenkins Jobs..."
JOBS=$(find ./jobs -type f -printf "%f\n" | cut -d'.' -f1)
rm jenkins-cli.jar 2> /dev/null
wget http://localhost:8080/jnlpJars/jenkins-cli.jar -o /dev/null

for job in $JOBS; do
	java -jar jenkins-cli.jar -s $JENKINS_URL create-job $job  < ./jobs/${job}.xml
done

rm jenkins-cli.jar


# this is so the jenkins is visible to the outside world
echo "\nStarting Ngrok port forward..."
killall ngrok 2>/dev/null
ngrok http 8080 > /dev/null &

# so the ngrok loads
sleep 5 

tunnel_url=$(curl -s http://localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url')

echo "\nConnect to your Jenkins via the given link: $tunnel_url\n"

