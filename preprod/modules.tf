module "vpc" {
  source = "../modules/vpc"

  env          = var.env
  project_name = var.project_name
  subnet_cidr  = "10.0.0.0/24"
}

module "storage" {
  source = "../modules/storage"

  env          = var.env
  project_name = var.project_name
}

module "database" {
  source = "../modules/database"

  env           = var.env
  project_name  = var.project_name
  vpc_id        = module.vpc.vpc_id
  vpc_self_link = module.vpc.vpc_self_link

  depends_on = [module.vpc]
}
