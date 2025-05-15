
provider "google" {
  project = "my-gcp-project"
  region  = "us-central1"
}

resource "google_container_cluster" "gke" {
  name     = "multicloud-gke"
  location = "us-central1"
  initial_node_count = 2

  node_config {
    machine_type = "e2-medium"
  }
}
