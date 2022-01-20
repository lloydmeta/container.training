
resource "google_compute_network" "main" {
  name                    = var.name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "_" {
  name          = var.name
  ip_cidr_range = "10.0.0.0/12"
  region        = var.region
  network       = google_compute_network.main.id
}
