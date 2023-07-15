#!/bin/sh

cd ./k8s
sh deploy.sh 
echo 'Kubernetes deployment successful.'
sleep 5
clear

cd ../jenkins
sh jenkins.sh
