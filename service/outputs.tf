output "vpc_name" {
  value = module.vpc.vpc_name
}

output "vpc_self_link" {
  value = module.vpc.vpc_self_link
}

output "artifact_url" {
  value = "${google_artifact_registry_repository.repository.location}-docker.pkg.dev/${google_artifact_registry_repository.repository.project}/${google_artifact_registry_repository.repository.name}"
}

# output "bastion_public_ip" {
#   value = google_compute_address.public_ip_address.address
# }
