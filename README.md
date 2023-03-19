# argocd-test

Testing out argoCD deployed in Minikube to trial out setting up a website. Test.

## Setup

### Minikube

Set up minikube following [this](https://minikube.sigs.k8s.io/docs/start/) guide. Run steps 1 & 2, essentialy:

1. Run the following
```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube start
```
2. Check you have kubectl installed ... if not [install](https://kubernetes.io/docs/tasks/tools/) it.
3. Check your on the correct context using
```
kubectl config get-context
```
4. If not switch context with
```
kubectl config set-context minikube
```

### Argocd

I followed the two guides, the [argoCD setup guide](https://argo-cd.readthedocs.io/en/stable/getting_started/) and [this](https://opensource.com/article/21/8/argo-cd#:~:text=Install%20Argo%20CD%20on%20a,and%20verify%20it%20using%20kubectl) blog post. As well as this [guide](https://blog.internetz.me/posts/my-road-to-self-hosted-kubernetes-with-k3s/) by our lord and master.

1. Make a new name space
```
kubectl create namespace argocd
```
2. Install predefined config into minikube using
```
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```
3. (Optional) You can choose to [install](https://argo-cd.readthedocs.io/en/stable/cli_installation/) the argocd CLI application at this point. 
4. Set the loadbalancer for the argocd UI.
```
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
```
5. Get the default password.
```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```
6. Set up the minikube tunnel to expose it on a seperate terminal.
```
minikube tunnel
```
7. Find out the port the argocd UI is running on. This will be the external-IP for argocd-server.
```
kubectl get svc -n argocd
```
8. (optional) Sign into the argocd CLI with the admin user.
```
argocd login <ARGOCD IP>
argocd cluster add minikube
```
9. Sign into the argocd UI with the admin user. Go to the <ARGOCD IP> and fill in the details there.
10. Generate an ssh-key pair to link the github repo to.
```
ssh-keygen -t rsa -b 4096 -f argocd
```
11. Add the .pub to this repo under settings/Deloy Keys and the other into the argocd UI under settings/repositories/connect repo using ssh.
12. 

## Rerunning

When back on your computer in one terminal run the following.

```
minikube start
minikube tunnel
```
