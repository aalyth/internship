# this shell exports the job given as first argument

if [ $# != 1 ]; then
	echo Error: expected only 1 argument - the job name.
	exit 1
fi

rm jenkins-cli.jar
wget http://localhost:8080/jnlpJars/jenkins-cli.jar

JENKINS_URL='http://localhost:8080'
java -jar jenkins-cli.jar -s $JENKINS_URL get-job "$1" > job.xml

rm jenkins-cli.jar
