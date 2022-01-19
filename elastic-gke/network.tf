
resource "google_compute_network" "main" {
  name    = "lloyd-k8s-training"
  project = "elastic-cloud-dev"
}