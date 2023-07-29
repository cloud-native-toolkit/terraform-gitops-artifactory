
variable cluster_username { 
  type        = string
  description = "The username for AWS access"
  default = ""
}

variable "cluster_password" {
  type        = string
  description = "The password for AWS access"
  default = ""
}

variable "cluster_ca_cert" {
  type        = string
  description = "The certificate authority for the cluster"
  default = ""
}

variable "server_url" {
  type        = string
  default = ""
}

variable "bootstrap_prefix" {
  type = string
  default = ""
}

variable "namespace" {
  type        = string
  description = "Namespace for tools"
  default = ""
}

variable "cluster_name" {
  type        = string
  description = "The name of the cluster"
  default     = ""
}

variable "cluster_type" {
  type        = string
  description = "The type of cluster that should be created (openshift or kubernetes)"
  default = ""
}

variable "cluster_exists" {
  type        = string
  description = "Flag indicating if the cluster already exists (true or false)"
  default     = "true"
}

variable "git_token" {
  type        = string
  description = "Git token"
  default = ""
}

variable "git_host" {
  type        = string
  default     = "github.com"
}

variable "git_type" {
  default = "github"
}

variable "git_org" {
  default = "cloud-native-toolkit-test"
}

variable "git_repo" {
  default = "git-module-test"
}

variable "gitops_namespace" {
  default = "openshift-gitops"
}

variable "git_username" {
  default = ""
}

variable "kubeseal_namespace" {
  default = "sealed-secrets"
}

variable "cp_entitlement_key" {
}
#variable "gitea_username" {
#  type = string
#  description = "The username for the instance"
#  default = "gitea-admin"
#}
#variable "gitea_password" {
#  type = string
#  description = "The password for the instance"
#  default = ""
#}
#variable "gitea_instance_name" {
#  type = string
#  description = "The name for the instance"
#  default = "gitea"
#}
#variable "gitea_namespace_name" {
#  type = string
#  description = "The value that should be used for the namespace"
#  default = "gitea"
#}
