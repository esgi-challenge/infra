output "vpc_name" {
  value = module.vpc.vpc_name
}

output "vpc_self_link" {
  value = module.vpc.vpc_self_link
}

# output "bastion_public_ip" {
#   value = google_compute_address.public_ip_address.address
# }
