# Argo CD Terraform Module

This Terraform module installs and configures Argo CD in a Kubernetes
cluster. It includes the following files:

- `argocd-values.yaml`: A YAML file containing configuration values for
  Argo CD.
- `argocd.tf`: A Terraform file that installs Argo CD using Helm.
- `ovh-kube-cluster.tf`: A Terraform file that creates a Kubernetes
  cluster using OVH Cloud.
- `output.tf`: A Terraform file that defines an output variable for the
  cluster's `kubeconfig` file.
- `provider.tf`: A Terraform file that sets up the required providers for
  OVH Cloud and Helm.
- `variables.tf.example`: A Terraform file that contains example
  variables for configuring the Kubernetes cluster and OVH Cloud
  credentials.

## Usage

To use this Terraform module, do the following:

1. Copy the `variables.tf.example` file to `variables.tf` and fill in
   the required variables with your own values.
2. Run `terraform init` to initialize the module.
3. Run `terraform apply` to create the Kubernetes cluster and install
   Argo CD.

## Files

- `argocd-values.yaml`: This file contains the configuration values for
  Argo CD. The `server.additionalApplications` section defines an
  additional application for Argo CD to manage, and the `server.extraArgs`
  and `server.config` sections configure additional options for the
  Argo CD server.

- `argocd.tf`: This file installs Argo CD using Helm, using the values
  defined in `argocd-values.yaml`. It also depends on the Kubernetes
  cluster resources created by `ovh-kube-cluster.tf`.

- `ovh-kube-cluster.tf`: This file creates a Kubernetes cluster using
  OVH Cloud. It defines a `ovh_cloud_project_kube` resource for the
  cluster itself, and a `ovh_cloud_project_kube_nodepool` resource for
  the cluster's node pool. It also creates a `local_file` resource to
  save the `kubeconfig` file locally.

- `output.tf`: This file defines an output variable for the `kubeconfig`
  file of the created Kubernetes cluster.

- `provider.tf`: This file sets up the required providers for OVH Cloud
  and Helm. It defines a `ovh` provider for OVH Cloud, and a `helm`
  provider for Helm. The `helm` provider is configured to use the
  `kubeconfig` file generated by `ovh-kube-cluster.tf`.

- `variables.tf.example`: This file contains example variables for
  configuring the Kubernetes cluster and OVH Cloud credentials. Copy
  this file to `variables.tf` and fill in the required variables with
  your own values.
