# Root variables.tf


variable "primary_app_name" {
  description = "The name of the primary web application."
  type        = string
  default     = "webapp-alpha"
}

variable "primary_replica_count" {
  description = "Number of replicas for the primary app."
  type        = number
  default     = 3
}

variable "primary_node_port" {
  description = "NodePort for the primary app."
  type        = number
  default     = 30001
}

variable "primary_display_message" {
  description = "Display message for the primary app."
  type        = string
  default     = "Welcome to Alpha Stack!"
}

variable "bonus_app_name" {
  description = "The name of the bonus web application."
  type        = string
  default     = "webapp-bonus"
}

variable "bonus_replica_count" {
  description = "Number of replicas for the bonus app."
  type        = number
  default     = 2
}

variable "bonus_node_port" {
  description = "NodePort for the bonus app."
  type        = number
  default     = 30002
}

variable "bonus_display_message" {
  description = "Display message for the bonus app."
  type        = string
  default     = "This is the Bonus Server speaking:"
}
