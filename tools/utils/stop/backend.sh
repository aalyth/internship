
docker image rm go-api-img
kubectl delete deployment go-api --cascade=foreground
kubectl delete hpa go-api 
kubectl delete service go-api-svc
