provider "google" {
  project = "${var.project}"
  zone = var.availability_zone
}

variable "project" {
  default = "elastic-cloud-dev"
}

variable "availability_zone" {
  default = "asia-northeast1-a"
}