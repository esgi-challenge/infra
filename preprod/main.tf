# resource "google_compute_global_address" "private_ip_block" {
#   name          = "${var.project_name}-${var.env}-private-ip-block"
#   purpose       = "VPC_PEERING"
#   address_type  = "INTERNAL"
#   ip_version    = "IPV4"
#   prefix_length = 20
#   network       = module.vpc.vpc_self_link
# }

# resource "google_service_networking_connection" "private_vpc_connection" {
#   network                 = google_compute_network.vpc.self_link
#   service                 = "servicenetworking.googleapis.com"
#   reserved_peering_ranges = [google_compute_global_address.private_ip_block.name]
# }
resource "google_compute_firewall" "allow_ssh" {
  name      = "${var.project_name}-${var.env}-allow-ssh"
  network   = module.vpc.vpc_name
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  target_tags   = ["ssh-enabled"]
  source_ranges = ["0.0.0.0/0"]
}
