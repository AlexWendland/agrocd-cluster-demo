# Deployment

This is my first attempt to use [Terraform](https://www.terraform.io/) to set
up a [kubernetes](https://kubernetes.io/) cluster on
[ovh](https://www.ovhcloud.com/en-gb/) with
[argocd](https://argo-cd.readthedocs.io/en/stable/).

## Kubernetes

Kubernetes is a container orchestrator that allows for easy hosting and scaling
of applications and services. I am using it to simplify a lot of the devops I
would otherwise have to learn. Using this in conjunction with argoCD allows me
to a infrastructure-as-code approach to adding services.

## Terraform

Terraform is a infrastructure-as-code tool. It is declarative where you state
what infrastructure you want and it makes the necessary steps to build that for
you. I will use this to document, build and maintain the servers I use.

## OVH

OVH are a cloud computing provider. I have not put that much research in
finding the cheapest provider, however they are supported by terraform and
offer free credits initially for me to test stuff out.

# Set up

For this guide I will assume locally you have installed

- [terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- All the things I forgot to list here

More detailed instructions will be in the README in the relevant folders.

1. Use terraform with the terraform directory to set up the infrastructure.
2. Generate ssh keys to link the kubernetes cluster to your github repo, I
saved these in the ssh folder.
3. Use the example in the argocd folder to add the private key to your argoCD
deployment.
