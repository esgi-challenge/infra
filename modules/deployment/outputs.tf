output "cloud_run_backend_uri" {
  value = google_cloud_run_v2_service.backend.uri
}
