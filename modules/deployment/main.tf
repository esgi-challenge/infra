resource "google_cloud_run_v2_service" "backend" {
  name     = "${var.project_name}-${var.env}-backend"
  location = "europe-west1"
  ingress  = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = "${var.artifact_url}/backend-${var.env}"
    }
  }
}

resource "google_cloud_run_service_iam_binding" "all_user" {
  service = google_cloud_run_v2_service.backend.name
  role    = "roles/run.invoker"
  members = ["allUsers"]
}
