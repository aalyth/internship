
# go-api image
docker image rm go-api-img
docker build -t go-api-img ./../backend

# go-api deployment
kubectl delete deployment go-api --cascade=foreground
kubectl apply -f ./../k8s/backend.yaml

# go-api horizontal autosclae
kubectl delete hpa go-api 
kubectl autoscale deployment go-api --cpu-percent=60 --min=3 --max=15

# go-api LB service
kubectl delete service go-api-svc
kubectl expose deployment go-api --name=go-api-svc --type=LoadBalancer --port=1337 --target-port=1337 

