terraform {
  required_providers {
    google = {
      version = "~> 5.0.0"
    }
  }
}
provider "google" {
  project = var.gcp_project
  region = var.gcp_region
  zone = var.gcp_zone
}

resource "google_container_cluster" "gke_cluster" { #example of not a great name
  name = "test-gke-cluster"
  location = var.gcp_region
  enable_autopilot = true
}

resource "google_artifact_registry_repository" "production_container_registry" { #example of a good name
  location = var.gcp_region
  repository_id = var.registry_name
  description = "Docker Registry - Prod"
  format = "DOCKER"
}

