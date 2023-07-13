
docker image rm frontend-img
kubectl delete deployment frontend --cascade=foreground
kubectl delete hpa frontend 
kubectl delete service frontend-svc
