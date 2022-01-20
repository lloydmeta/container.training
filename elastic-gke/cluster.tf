resource "google_container_cluster" "k8s-cluster" {
  name       = "lloyd-k8s-training"
  location   = var.availability_zone
  network    = google_compute_network.main.name
  subnetwork = google_compute_subnetwork._.name

  networking_mode = "VPC_NATIVE"
  ip_allocation_policy {
    # This is the block that will be used for pods.
    cluster_ipv4_cidr_block = "10.16.0.0/12"
  }

  node_pool {
    name = "builtin"
  }
  lifecycle {
    ignore_changes = [node_pool]
  }
}

resource "google_container_node_pool" "ondemand" {
  name    = "ondemand"
  cluster = google_container_cluster.k8s-cluster.id
  autoscaling {
    min_node_count = 0
    max_node_count = 5
  }
  node_config {
    preemptible = false

    labels = {
      pool = "ondemand"
    }
  }
}

resource "google_container_node_pool" "preemptible" {
  name               = "preemptible"
  cluster            = google_container_cluster.k8s-cluster.id
  initial_node_count = 1
  autoscaling {
    min_node_count = 1
    max_node_count = 5
  }
  node_config {
    preemptible = true

    labels = {
      pool = "preemptible"
    }
  }
}
