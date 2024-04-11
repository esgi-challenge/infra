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
