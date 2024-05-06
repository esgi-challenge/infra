resource "google_cloud_run_v2_service" "backend" {
  name     = "${var.project_name}-${var.env}-backend"
  location = "europe-west1"
  ingress  = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = "${var.artifact_url}/backend-${var.env}:latest"

      dynamic "env" {
        for_each = var.env_variables

        content {
          name  = env.key
          value = env.value
        }
      }

      volume_mounts {
        name       = "cloudsql"
        mount_path = "/cloudsql"
      }
    }

    volumes {
      name = "cloudsql"
      cloud_sql_instance {
        instances = [var.db_connection]
      }
    }

    vpc_access {
      network_interfaces {
        network    = var.vpc_name
        subnetwork = var.subnet_name
      }
    }
  }
}

resource "google_cloud_run_service_iam_binding" "all_user" {
  service = google_cloud_run_v2_service.backend.name
  role    = "roles/run.invoker"
  members = ["allUsers"]
}
