
# frontend image
docker image rm frontend-img
docker build -t frontend-img ./../frontend

# frontend deployment
kubectl delete deployment frontend --cascade=foreground
kubectl apply -f ./../k8s/frontend.yaml

# frontend horizontal autosclae
kubectl delete hpa frontend 
kubectl autoscale deployment frontend --cpu-percent=60 --min=3 --max=15

# frontend LB service
kubectl delete service frontend-svc
kubectl expose deployment frontend --name=frontend-svc --type=LoadBalancer --port=1337 --target-port=1337 

