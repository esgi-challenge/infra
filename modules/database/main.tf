resource "google_sql_database_instance" "database" {
  name             = "${var.project_name}-${var.env}-database"
  database_version = "POSTGRES_15"
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
