################### TFSTATE ########################
resource "google_storage_bucket" "default" {
  name          = "${var.project_name}-bucket-tfstate"
  force_destroy = false
  location      = "EU"
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}
####################################################

module "prod" {
  source = "./prod"

  env          = "prod"
  project_name = var.project_name
}

module "preprod" {
  source = "./preprod"

  env          = "preprod"
  project_name = var.project_name
}
