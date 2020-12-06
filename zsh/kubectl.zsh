#Functions

# Get inside a pod
podbo() {
  kubectl exec -it $(kubectl get pod -l app=backoffice-pod -o jsonpath='{.items[0].metadata.name}') bash
}

podfo() {
  kubectl exec -it $(kubectl get pod -l app=frontoffice-pod -o jsonpath='{.items[0].metadata.name}') bash
}

podapi() {
  kubectl exec -it $(kubectl get pod -l app=api-pod -o jsonpath='{.items[0].metadata.name}') bash
}

podjobs() {
  kubectl exec -it $(kubectl get pod -l app=jobs-pod -o jsonpath='{.items[0].metadata.name}') bash
}

kpod() {
  kubectl exec -it $(kubectl get pod -l app=$1-pod -o jsonpath='{.items[0].metadata.name}') bash
}

# Get logs
klogs() {
 kubectl exec $(kubectl get pod -l app=$1-pod -o jsonpath='{.items[0].metadata.name}') -- tail -f log/staging.log
}

