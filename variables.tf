# Root variables.tf

variable "app_configs" {
  description = "Configurations for web applications."
  type = map(object({
    name            = string
    replica_count   = number
    node_port       = number
    display_message = string
  }))
  default = {
    primary = {
      name            = "webapp-alpha"
      replica_count   = 3
      node_port       = 30001
      display_message = "Welcome to Alpha Stack!"
    }
    bonus = {
      name            = "webapp-bonus"
      replica_count   = 2
      node_port       = 30002
      display_message = "This is the Bonus Server speaking:"
    }
  }
}
