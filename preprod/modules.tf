module "vpc" {
  source = "../modules/vpc"

  env          = var.env
  project_name = var.project_name
}

module "storage" {
  source = "../modules/storage"

  env          = var.env
  project_name = var.project_name
}
