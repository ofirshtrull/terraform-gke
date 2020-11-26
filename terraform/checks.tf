resource "null_resource" "check_requirements" {
  provisioner "local-exec" {
    command = <<EOT
      set -e
      gcloud version
      terraform version
      kustomize version
      jq --version
      kubectl version --client
      argocd version --client
EOT
  }
}
