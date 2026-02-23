# Module variables.tf

variable "app_name" {
  description = "The name of the web application."
  type        = string
}

variable "replica_count" {
  description = "Number of replicas for the deployment."
  type        = number

  validation {
    condition     = var.replica_count > 0
    error_message = "replica_count must be greater than 0."
  }
}

variable "display_message" {
  description = "Message to display from the web app."
  type        = string
  default     = "Hello! You are being served by"
}

variable "service_port" {
  description = "Port exposed by the Kubernetes service."
  type        = number
  default     = 80
}

variable "container_port" {
  description = "Port the container listens on."
  type        = number
  default     = 5678
}