Install ARGOCD Using HELM:
kubectl create ns argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl get all -n argocd

To expose ARGOCD SERVER :
kubectl patch svc argocd-server -n argocd -p '{"spec":{"type":"LoadBalancer"}}'
yum install jg -y
export ARGOCD_SERVER='kubectl get svc argocd-server -n argocd -o json | jq --raw-output '.status.loadBalancer.ingress[0].hostname''
echo $ARGOCD_SERVER
kubectl get svc argocd-server -n argocd -o json | jq --raw-output .status.loadBalancer.ingress[0].hostname
The above command provides loadbalancer URL to access ARGOCD

TO GET ARGOCD Password:
export ARGO_PWD='kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}"| base64 -d'
echo $ARGO_PWD
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}"| base64 -d
The above command provides PASSWORD for ARGOCD
