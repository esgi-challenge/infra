output "db_private_ip" {
  value = google_sql_database_instance.database.private_ip_address
}

output "db_connection" {
  value = google_sql_database_instance.database.connection_name
}
