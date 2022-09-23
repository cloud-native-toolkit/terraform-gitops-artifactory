module "gitops_artifactory" {
  source = ".."

  gitops_config = module.gitops.gitops_config
  git_credentials = module.gitops.git_credentials
  namespace = module.gitops_namespace.name
  server_name = module.gitops.server_name
}
