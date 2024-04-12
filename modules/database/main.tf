resource "google_sql_database_instance" "database" {
  name                = "${var.project_name}-${var.env}-database"
  database_version    = "POSTGRES_15"
  deletion_protection = false

  settings {
    tier              = var.db_tier
    edition           = "ENTERPRISE"
    availability_type = "ZONAL"
    disk_size         = var.db_disk_size

    ip_configuration {
      ipv4_enabled                                  = false
      private_network                               = var.vpc_id
      enable_private_path_for_google_cloud_services = true
    }
  }
}

resource "google_sql_user" "db_user" {
  name     = var.user.name
  password = var.user.password
  instance = google_sql_database_instance.database.name
}

resource "google_sql_database" "challenge_database" {
  name     = var.project_name
  instance = google_sql_database_instance.database.name
}

resource "google_compute_global_address" "private_ip_block" {
  name          = "${var.project_name}-${var.env}-private-ip-block"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  ip_version    = "IPV4"
  prefix_length = 20
  network       = var.vpc_self_link
}

resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = var.vpc_self_link
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_block.name]
}
