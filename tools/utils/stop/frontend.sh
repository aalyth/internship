
kubectl delete deployment frontend --cascade=foreground
kubectl delete hpa frontend 
kubectl delete service frontend-svc
