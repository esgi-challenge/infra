output "db_private_ip" {
  value = google_sql_database_instance.database.private_ip_address
}

output "db_connection" {
  value = google_sql_database_instance.database.connection_name
}

output "db_user" {
  value = {
    name     = google_sql_user.db_user.name
    password = google_sql_user.db_user.password
  }

  sensitive = true
}

output "pg_db_name" {
  value = google_sql_database.challenge_database.name
}
