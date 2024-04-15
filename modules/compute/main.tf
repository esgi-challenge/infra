resource "google_compute_firewall" "allow_ssh" {
  name      = "${var.project_name}-${var.env}-allow-ssh"
  network   = var.vpc_name
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  target_tags   = ["ssh-enabled"]
  source_ranges = var.ssh_ip_allowed
}

data "google_compute_default_service_account" "default" {}

resource "google_compute_address" "public_ip_address" {
  name = "${var.project_name}-${var.env}-public-ip"
}

resource "google_compute_instance" "bastion" {
  name                      = "${var.project_name}-${var.env}-bastion"
  machine_type              = var.machine_type
  zone                      = var.zone
  allow_stopping_for_update = true

  tags = ["ssh-enabled"]

  metadata_startup_script = <<-EOF
  sudo apt update -y
  sudo apt install -y postgresql-client
  EOF

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network    = var.vpc_name
    subnetwork = var.subnet_name

    access_config {
      nat_ip = google_compute_address.public_ip_address.address
    }
  }

  service_account {
    email  = data.google_compute_default_service_account.default.email
    scopes = ["cloud-platform"]
  }
}
