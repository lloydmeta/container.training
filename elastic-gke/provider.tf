provider "google" {
  project = "${var.project}"
  zone = var.availability_zone
}