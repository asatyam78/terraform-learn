terraform {
  cloud {
    organization = "demo-learn-terraform"

    workspaces {
      name = "learn-terraform-cloud"
    }
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.instance_machine_type

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.id
  }
}

resource "google_storage_bucket" "storage_bucket" {
  name          = var.bucket_name
  location      = "US-CENTRAL1"
  force_destroy = true
}