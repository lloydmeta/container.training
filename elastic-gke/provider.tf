provider "google" {
  project = "${var.project}"
}

variable "project" {
  default = "elastic-cloud-dev"
}
