resource "google_compute_network" "vpc" {
  name                    = "${var.project_name}-${var.env}-vpc"
  auto_create_subnetworks = false
}
