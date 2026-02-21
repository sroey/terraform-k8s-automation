
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
            container_port = var.container_port
          }

          readiness_probe {
            http_get {
              path = "/"
              port = var.container_port
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
      port        = var.service_port
      target_port = var.container_port
    }
    type = "ClusterIP"
      }
}

resource "kubernetes_ingress_v1" "web_ingress" {
  metadata {
    name = "${var.app_name}-ingress"
  }

  spec {
    rule {
      http {
        path {
          path = "/${var.app_name}"
          path_type = "Prefix"
          backend {
            service {
              name = kubernetes_service.web_service.metadata[0].name
              port {
                number = var.service_port
              }
            }
          }
        }
      }
    }
  }
}