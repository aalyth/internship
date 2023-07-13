
# frontend image
docker image rm frontend-img
docker build -t frontend-img ./../frontend

# frontend deployment
kubectl delete deployment frontend --cascade=foreground
kubectl apply -f ./../k8s/frontend.yaml

# frontend horizontal autosclae
kubectl delete hpa frontend 
kubectl autoscale deployment frontend --cpu-percent=40 --min=2 --max=5

# frontend LB service
kubectl delete service frontend-svc
kubectl expose deployment frontend --name=frontend-svc --type=LoadBalancer --port=80 --target-port=3000 

