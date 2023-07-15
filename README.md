#  internship
## Requirements
In order to run the project you need:
* Linux OS / WSL
* [Docker Engine](https://docs.docker.com/engine/install/) and [Docker Desktop](https://www.docker.com/products/docker-desktop/) with [enabled Kubernetes](https://docs.docker.com/desktop/kubernetes/)
* [Kubectl](https://kubernetes.io/docs/tasks/tools/)

## Setup
* run the script ```install.sh``` to install all the needed tools
* run the script ```setup.sh``` to deploy the Kubernetes and Jenkins setups 
* go to the Jenkins url and inside ```cd-backend``` go to the bottom and you will see ```Registry Credentials```, add your Docker Hub username and key and set the credential ID to ```DH_CREDS```.
* go to the GitHub repo ```settings > secrets and variables > actions``` and create the secret with name ```JENKINS_URL``` with the url from the script
