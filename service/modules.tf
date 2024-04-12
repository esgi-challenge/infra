module "vpc" {
  source = "../modules/vpc"

  env          = var.env
  project_name = var.project_name
  subnet_cidr  = "10.0.2.0/24"
}
