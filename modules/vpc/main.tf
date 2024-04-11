resource "google_compute_network" "vpc" {
  name                    = "${var.project_name}-${var.env}-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "private_subnet" {
  name          = "${var.project_name}-${var.env}-subnet"
  ip_cidr_range = var.subnet_cidr
  region        = var.subnet_region
  network       = google_compute_network.vpc.id
}

