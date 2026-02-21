# Root variables.tf

variable "kubeconfig_path" {
  description = "Path to the kubeconfig file."
  type        = string
}

variable "app_configs" {
  description = "Configurations for web applications."
  type = map(object({
    name            = string
    replica_count   = number
    display_message = string
  }))
}
