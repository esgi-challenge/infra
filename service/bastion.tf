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

resource "google_compute_address" "public_ip_address" {
  name = "${var.project_name}-${var.env}-public-ip"
}

data "google_compute_default_service_account" "default" {}

resource "google_compute_instance" "bastion" {
  name         = "${var.project_name}-${var.env}-bastion"
  machine_type = "e2-micro"
  zone         = "europe-west1-b"
  allow_stopping_for_update = true

  tags = ["ssh-enabled"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network    = module.vpc.vpc_name
    subnetwork = module.vpc.subnet_name

    access_config {
      nat_ip = google_compute_address.public_ip_address.address
    }
  }

  service_account {
    email  = data.google_compute_default_service_account.default.email
    scopes = ["cloud-platform"]
  }

  depends_on = [google_compute_address.public_ip_address]
}
