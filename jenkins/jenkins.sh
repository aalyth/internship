
sudo systemctl start docker

# JCasC - Jenkins Configuration as Code
docker image rm jenkins:jcasc
docker build -t jenkins:jcasc .

docker compose down jenkins
docker compose up -d

JENKINS_URL='http://localhost:8080'

echo "\nAwaiting Jenkins start ...\n"
until $(curl --output /dev/null --silent --head --fail $JENKINS_URL); do
    sleep 2
done

rm jenkins-cli.jar
wget http://localhost:8080/jnlpJars/jenkins-cli.jar

java -jar jenkins-cli.jar -s $JENKINS_URL create-job 'internship' < ./jobs/internship.xml

rm jenkins-cli.jar

# !!! you need to add your own GitHub Credentials in the Dashboard > Manage Jenkins > System

# install the docker plugin
# you need to port forward the jenkins webhook so github can access it
