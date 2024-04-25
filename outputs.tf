output "prod" {
  value = {
    vpc_name   = module.prod.vpc_name
    bucket_url = module.prod.bucket_url
  }

  description = "Prod outputs"
}

output "preprod" {
  value = {
    vpc_name              = module.preprod.vpc_name
    bucket_url            = module.preprod.bucket_url
    db_private_ip         = module.preprod.db_private_ip
    bastion_private_ip    = module.preprod.bastion_private_ip
    cloud_run_backend_uri = module.preprod.cloud_run_backend_uri
  }

  description = "Preprod outputs"
}

output "service" {
  value = {
    vpc_name     = module.service.vpc_name
    artifact_url = module.service.artifact_url
    # bastion_public_ip = module.service.bastion_public_ip
  }

  description = "Service outputs"
}
