# Root variables.tf

variable "app_config" {
  description = "Shared configuration for web applications."
  type = object({
    replica_count   = number
    node_port       = number
    display_message = string
  })
  default = {
    replica_count   = 3
    node_port       = 30001
    display_message = "Welcome to Alpha Stack!"
  }
}

variable "app_names" {
  description = "Names for the web applications."
  type = map(string)
  default = {
    primary = "webapp-alpha"
    bonus   = "webapp-bonus"
  }
}
