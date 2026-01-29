# GitOps controller applying platform tools
kubectl -n argocd get app platform-apps
kubectl -n argocd get app monitoring -o jsonpath='{.status.sync.status}{"  "}{.status.health.status}{"\n"}'

# Prometheus stack health
kubectl -n monitoring get pods | egrep -i 'prometheus|grafana|alertmanager' 

# Alertmanager now exists (GitOps change result)
kubectl -n monitoring get sts,svc | grep -i alertmanager
