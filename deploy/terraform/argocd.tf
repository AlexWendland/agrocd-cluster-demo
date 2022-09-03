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

  lifecycle {
    ignore_changes = [
      metadata
    ]
  }

}

#
# This adds the git repo to argocd
#

resource "argocd_repository" "private" {
  repo            = "git@private-git-repository.local:somerepo.git"
  username        = "git"
  ssh_private_key = "-----BEGIN OPENSSH PRIVATE KEY-----\nfoo\nbar\n-----END OPENSSH PRIVATE KEY-----"
  insecure        = true
}