variable "app_name" { type = string }
variable "replica_count" { type = number }

variable "display_message" {
  type    = string
  default = "Updated. Hello! You are being served by"
}

variable "node_port" { type = number }

resource "kubernetes_deployment" "web_app" {
  metadata {
    name   = var.app_name
    labels = { app = var.app_name }
  }

  spec {
    replicas = var.replica_count
    selector {
      match_labels = { app = var.app_name }
    }
    template {
      metadata {
        labels = { app = var.app_name }
      }
      spec {
        container {
          image = "hashicorp/http-echo:latest"
          name  = "web-server"

          # We pass the env variables into the text argument
          # Note: http-echo will render $(VAR) if passed this way
          args = ["-text=${var.display_message} Pod: $(MY_POD_NAME) | IP: $(MY_POD_IP)"]

          env {
            name = "MY_POD_NAME"
            value_from {
              field_ref {
                field_path = "metadata.name"
              }
            }
          }
          env {
            name = "MY_POD_IP"
            value_from {
              field_ref {
                field_path = "status.podIP"
              }
            }
          }

          port {
            container_port = 5678
          }

          readiness_probe {
            http_get {
              path = "/"
              port = 5678
            }
            initial_delay_seconds = 3
            period_seconds        = 5
          }
        }
      }
    }
  }
}

# The "Endpoint" accessible locally
resource "kubernetes_service" "web_service" {
  metadata { name = "${var.app_name}-service" }
  spec {
    selector = { app = var.app_name }
    port {
      port        = 80
      target_port = 5678
    }
    type = "NodePort"
  }
}