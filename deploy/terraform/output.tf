output "kubeconfig" {
  value = ovh_cloud_project_kube.kubernetes_cluster.kubeconfig
  sensitive = true
}