#!/bin/sh

docker image rm backend-img
kubectl delete deployment backend --cascade=foreground
kubectl delete hpa backend 
kubectl delete service backend-svc
