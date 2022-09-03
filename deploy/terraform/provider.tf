terraform {
  required_providers {
    ovh = {
      source  = "ovh/ovh"
    }
  }
}

provider "ovh" {
  endpoint           = "ovh-eu"
  application_key    = var.ovh_application_key
  application_secret = var.ovh_application_secret
  consumer_key       = var.ovh_consumer_key
}

provider "helm" {
   kubernetes {
      host                    =  yamldecode(ovh_cloud_project_kube.kubernetes_cluster.kubeconfig).clusters[0].cluster.server
      client_certificate      = base64decode(yamldecode(ovh_cloud_project_kube.kubernetes_cluster.kubeconfig).users[0].user.client-certificate-data)
      client_key              = base64decode(yamldecode(ovh_cloud_project_kube.kubernetes_cluster.kubeconfig).users[0].user.client-key-data)
      cluster_ca_certificate  = base64decode(yamldecode(ovh_cloud_project_kube.kubernetes_cluster.kubeconfig).clusters[0].cluster.certificate-authority-data)
   }
}