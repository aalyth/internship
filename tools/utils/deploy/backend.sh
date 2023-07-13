
# backend image
docker image rm backend-img
docker build -t backend-img ./../backend

# backend deployment
kubectl delete deployment backend --cascade=foreground
kubectl apply -f ./../k8s/backend.yaml

# backend horizontal autoscale
kubectl delete hpa backend 
kubectl autoscale deployment backend --cpu-percent=60 --min=3 --max=15

# backend LB service
kubectl delete service backend-svc
kubectl expose deployment backend --name=backend-svc --type=LoadBalancer --port=1337 --target-port=1337 

