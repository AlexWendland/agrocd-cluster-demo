resource "ovh_cloud_project_kube" "kubernetes_cluster" {
   service_name = var.service_name
   name         = var.kubernetes_cluster_name
   region       = var.os_region_name
   version      = var.kubernetes_version
}

resource "ovh_cloud_project_kube_nodepool" "node_pool" {
   service_name  = var.service_name
   kube_id       = ovh_cloud_project_kube.kubernetes_cluster.id
   name          = var.kubernetes_nodepool_name
   flavor_name   = var.kubernetes_flavor_name
   desired_nodes = var.kubernetes_nodepool_desired_nodes
   max_nodes     = var.kubernetes_nodepool_max_nodes
   min_nodes     = var.kubernetes_nodepool_min_nodes
}

resource "local_file" "kubeconfig" {
   content     = ovh_cloud_project_kube.kubernetes_cluster.kubeconfig
   filename = "${path.module}/kubeconfig.yml"
   lifecycle {
      ignore_changes = [
         filename,
         content
      ]
   }
}