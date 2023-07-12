#!/bin/sh

sudo systemctl start docker

# backend image
docker image rm backend-img
docker build -t backend-img ./../backend

# metrics server
kubectl delete -f components.yaml
kubectl apply -f ./../k8s/components.yaml

# backend deployment
kubectl delete deployment backend --cascade=foreground
kubectl apply -f ./../k8s/backend.yaml

# backend horizontal autosclae
kubectl delete hpa backend 
kubectl autoscale deployment backend --cpu-percent=60 --min=3 --max=15

# backend LB service
kubectl delete service backend-svc
kubectl expose deployment backend --name=backend-svc --type=LoadBalancer --port=80 --target-port=1337 

