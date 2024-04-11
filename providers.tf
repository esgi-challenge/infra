provider "google" {
  project = var.project_id
  region  = "europe-west1"

  default_labels = {
    managed_by = "terraform"
  }
}
