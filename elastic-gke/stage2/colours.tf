resource "kubernetes_deployment" "blue" {
  metadata {
    name      = "blue"
    namespace = "default"
  }
  spec {
    selector {
      match_labels = {
        app = "blue"
      }
    }
    template {
      metadata {
        labels = {
          app = "blue"
        }
      }
      spec {
        container {
          name  = "blue"
          image = "jpetazzo/color"
        }
      }
    }
  }
}

resource "kubernetes_service" "blue" {
  metadata {
    name      = "blue"
    namespace = "default"
  }
  spec {
    type = "LoadBalancer"
    selector = {
      app = "blue"
    }
    port {
      name        = "http"
      port        = 80
      target_port = 80
    }
  }
}

resource "kubernetes_deployment" "red" {
  metadata {
    name      = "red"
    namespace = "default"
  }
  spec {
    replicas = 3
    selector {
      match_labels = {
        app = "red"
      }
    }
    template {
      metadata {
        labels = {
          app = "red"
        }
      }
      spec {
        container {
          name  = "red"
          image = "jpetazzo/color"
        }
      }
    }
  }
}

resource "kubernetes_service" "red" {
  metadata {
    name      = "red"
    namespace = "default"
  }
  spec {
    type = "LoadBalancer"
    selector = {
      app = "red"
    }
    port {
      name        = "http"
      port        = 80
      target_port = 80
    }
  }
}
