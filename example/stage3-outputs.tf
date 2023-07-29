
resource null_resource write_outputs {
  provisioner "local-exec" {
    command = "echo \"$${OUTPUT}\" > gitops-output.json"

    environment = {
      OUTPUT = jsonencode({
        name        = module.gitops_artifactory.name
        branch      = module.gitops_artifactory.branch
        namespace   = module.gitops_artifactory.namespace
        server_name = module.gitops_artifactory.server_name
        layer       = module.gitops_artifactory.layer
        layer_dir   = module.gitops_artifactory.layer == "infrastructure" ? "1-infrastructure" : (module.gitops_artifactory.layer == "services" ? "2-services" : "3-applications")
        type        = module.gitops_artifactory.type
        ingress_host = module.gitops_artifactory.ingress_host
      })
    }
  }
}
