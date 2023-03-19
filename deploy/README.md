# Deployment

This is a repository for deploying a [kubernetes](https://kubernetes.io/)
cluster on [ovh](https://www.ovhcloud.com/en-gb/) using
[Terraform](https://www.terraform.io/) and [argoCD](https://argo-cd.readthedocs.io/en/stable/).

## Kubernetes

Kubernetes is a container orchestrator that allows for easy hosting and scaling
of applications and services. It simplifies a lot of devops tasks by automating
many aspects of infrastructure management. By using Kubernetes with argoCD, we
can take an infrastructure-as-code approach to deploying services.

## Terraform

Terraform is an infrastructure-as-code tool that allows you to declare and
manage your infrastructure in a declarative way. By using Terraform to manage
the kubernetes cluster, we can document, build and maintain the infrastructure
in a consistent way.

## OVH

OVH is a cloud computing provider. While there are many cloud providers out
there, OVH is supported by Terraform and offers free credits initially for
testing purposes.

# Set up

To use this repository, you'll need to have the following installed locally:

- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- Other required tools (see relevant READMEs in each folder)

Detailed setup instructions are included in the relevant README files.

To set up the infrastructure:

1. Use Terraform with the terraform directory to set up the infrastructure.
2. Generate ssh keys to link the kubernetes cluster to your GitHub repo, and
   save these keys in the ssh folder.
3. Use the example in the argoCD folder to add the private key to your argoCD
   deployment.
