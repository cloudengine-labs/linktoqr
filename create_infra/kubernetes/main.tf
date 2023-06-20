resource "kubernetes_namespace" "ns_linktoqr" {
  metadata {
    name = var.kubernetes_namespace_value
  }
}

resource "kubernetes_deployment" "linktoqr" {
  metadata {
    name = "terraform-example"
    labels = {
      tier = "frontend"
    }
    namespace = var.kubernetes_namespace_value
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        tier = "frontend"
      }
    }

    template {
      metadata {
        labels = {
          tier = "frontend"
        }
      }

      spec {
        container {
          image = "nginx:latest"
          name  = "nginx"

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}
