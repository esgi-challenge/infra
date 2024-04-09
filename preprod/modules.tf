module "vpc" {
  source = "../modules/vpc"

  env          = var.env
  project_name = var.project_name
}
