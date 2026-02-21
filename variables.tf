variable "kubeconfig_path" {
  description = "Path to the kubeconfig file."
  type        = string
  default     = "~/.kube/config"
}
# Root variables.tf

variable "app_configs" {
  description = "Configurations for web applications."
  type = map(object({
    name            = string
    replica_count   = number
    display_message = string
  }))
  default = {
    primary = {
      name            = "webapp-alpha"
      replica_count   = 3
      display_message = "Welcome to Alpha Stack!"
    }
    bonus = {
      name            = "webapp-bonus"
      replica_count   = 2
      display_message = "This is the Bonus Server speaking:"
    }
  }
}
