resource "kubernetes_namespace" "ns_linktoqr" {
  metadata {
    name = var.kubernetes_namespace_value
  }
}

resource "kubernetes_deployment" "linktoqr_deployment" {
  metadata {
    name = "linktoqr"
    labels = {
      tier = "backend"
    }
    namespace = var.kubernetes_namespace_value
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        tier = "backend"
      }
    }

    template {
      metadata {
        labels = {
          tier = "backend"
        }
      }

      spec {
        container {
          image = "gsdockit/linktoqr:latest"
          name  = "linktoqr"

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
