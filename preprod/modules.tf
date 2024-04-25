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

module "bastion" {
  source = "../modules/compute"

  env            = var.env
  project_name   = var.project_name
  ssh_ip_allowed = ["0.0.0.0/0"]
  vpc_name       = module.vpc.vpc_name
  subnet_name    = module.vpc.subnet_name
  zone           = "europe-west1-d"
  machine_type   = "e2-micro"

  depends_on = [module.vpc]
}

module "deployments" {
  source = "../modules/deployment"

  env          = var.env
  project_name = var.project_name
  artifact_url = var.artifact_url
}
