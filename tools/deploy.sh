#!/bin/sh

# sudo systemctl start docker

# metrics server
kubectl delete -f components.yaml
kubectl apply -f ./../k8s/components.yaml

sh utils/deploy/backend.sh
sh utils/deploy/frontend.sh
