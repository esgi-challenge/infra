resource "google_storage_bucket" "storage" {
  name          = "${var.project_name}-${var.env}-storage"
  force_destroy = false
  location      = "EU"
  storage_class = "STANDARD"

  versioning {
    enabled = true
  }

  labels = {
    env = var.env
  }
}

resource "google_storage_bucket_object" "storage_folder_profile_pictures" {
  name    = "profile-pictures/"
  content = "folder"
  bucket  = google_storage_bucket.storage.name
}

resource "google_storage_bucket_object" "storage_folder_files" {
  name    = "files/"
  content = "folder"
  bucket  = google_storage_bucket.storage.name
}
