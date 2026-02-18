# Module variables.tf

variable "app_name" {
  description = "The name of the web application."
  type        = string
}

variable "replica_count" {
  description = "Number of replicas for the deployment."
  type        = number
}

variable "display_message" {
  description = "Message to display from the web app."
  type        = string
  default     = "Updated. Hello! You are being served by"
}

variable "node_port" {
  description = "NodePort value for the service."
  type        = number
}
