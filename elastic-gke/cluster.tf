resource "google_container_cluster" "k8s-cluster" {
  name               = "lloyd-k8s-training"
  location           = "asia-northeast1"
  initial_node_count = 1
  project            = "elastic-cloud-dev"
  network            = "${google_compute_network.main.name}"
}

resource "google_compute_network" "main" {
  name    = "lloyd-k8s-training"
  project = "elastic-cloud-dev"
}
