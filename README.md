#  internship
## Requirements
In order to run the project you need:
* Linux OS
* [Docker Engine](https://docs.docker.com/engine/install/) and [Docker Desktop](https://www.docker.com/products/docker-desktop/) with [enabled Kubernetes](https://docs.docker.com/desktop/kubernetes/)
* [Kubectl](https://kubernetes.io/docs/tasks/tools/)
* Yq (```sudo snap install yq```)

## Setup
* go to ```tools/``` and run ```deploy.sh```
* run the ```jenkins/jenkins.sh``` script
* go to the repo ```settings > secrets and variables > actions``` and create the secret with name ```JENKINS_URL``` with the url from the script
* go to the url and inside ```cd-backend``` go to the bottom and you will see ```Registry Credentials```, add your Docker Hub username and key and set the credential ID to ```DH_CREDS```.
