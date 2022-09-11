#
# This installs argocd
#

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  create_namespace = true
  namespace = "argocd"
  values = [
    "${file("argocd-values.yaml")}"
  ]
  depends_on = [
    ovh_cloud_project_kube.kubernetes_cluster,
    ovh_cloud_project_kube_nodepool.node_pool
  ]
}