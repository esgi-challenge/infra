module "vpc" {
  source = "../modules/vpc"

  env          = var.env
  project_name = var.project_name
  subnet_cidr  = "10.0.1.0/24"
}

module "storage" {
  source = "../modules/storage"

  env          = var.env
  project_name = var.project_name
}
