data "google_client_config" "_" {
}

data "google_container_cluster" "_" {
  name     = "lloyd-k8s-training"
  location = "asia-northeast1-a"

  project = var.project
}

provider "kubernetes" {
  host                   = "https://${data.google_container_cluster._.endpoint}"
  token                  = data.google_client_config._.access_token
  cluster_ca_certificate = base64decode(data.google_container_cluster._.master_auth[0].cluster_ca_certificate)
}
