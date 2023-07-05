#  internship
## Requirements
In order to run the project you need:
* Linux OS
* [Docker Engine](https://docs.docker.com/engine/install/) and [Docker Desktop](https://www.docker.com/products/docker-desktop/)

## Setup
First, run the ```jenkins.sh``` script inside the ```jenkins/``` folder. Once you have that set up you need to [generate yourself a GitHub Access Token](https://secops-sandbox-documentation.readthedocs.io/en/latest/jenkins_github_integration.html#setting-up-the-personal-access-token). After that go to ```localhost:8080``` and there go to ```Manage Jenkins > System > GitHub Server``` and insert your Token as Secret Text Credentials. Finally copy the github link from the ```jenkins.sh``` output and go to your repository and add a Webhook to that link (without SSH).
