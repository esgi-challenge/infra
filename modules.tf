module "service" {
  source = "./service"

  env          = "service"
  project_name = var.project_name
}

module "prod" {
  source = "./prod"

  env          = "prod"
  project_name = var.project_name

  depends_on = [module.service]
}

module "preprod" {
  source = "./preprod"

  env          = "preprod"
  project_name = var.project_name
  artifact_url = module.service.artifact_url

  depends_on = [module.service]
}
