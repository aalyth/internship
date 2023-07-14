#  internship
## Requirements
In order to run the project you need:
* Linux OS
* [Docker Engine](https://docs.docker.com/engine/install/) and [Docker Desktop](https://www.docker.com/products/docker-desktop/) with [enabled Kubernetes](https://docs.docker.com/desktop/kubernetes/)
* [Kubectl](https://kubernetes.io/docs/tasks/tools/)
* Yq (```sudo snap install yq```)

## Setup
First, run the ```jenkins.sh``` script inside the ```jenkins/``` folder. Once you have that set up you need to go to the repo ```settings > secrets and variables > actions``` and create the secret with name ```JENKINS_URL``` with the value returned by the script. Finally go to the url and inside ```cd-backend``` go to the bottom and you will see ```Registry Credentials```. There, add your Docker Hub username and key and set the credential ID to ```DH_CREDS```.
