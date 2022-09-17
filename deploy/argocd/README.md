# Argocd Setup

The folder is used to set up argoCD and its first application.

## Steps

1. Run the following commands to apply the manifests here.

```
kubectl apply -f argocd-repositories.yaml
kubectl apply -f my-applications.yaml
```

2. Run the following command to let you access the argoCD dashboard.

```
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
```

3. Then use the following command to find the port of the dashboard.

```
kubectl get services -A
```

4. Use the external port on argocd-server to access the dashboard through the
browser.

5. To log in use the user name 'admin' and find the password by running.

```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```

6. For safety reasons change this password on the UI and then delete the
secrete using the following command.

```
kubectl -n argocd delete secret argocd-initial-admin-secret
```

