################### TFSTATE ########################
resource "google_storage_bucket" "default" {
  name          = "${var.project_name}-bucket-tfstate"
  force_destroy = false
  location      = "EU"
  storage_class = "STANDARD"

  versioning {
    enabled = true
  }
}
####################################################

resource "google_compute_network_peering" "svc_preprod_peering" {
  name         = "service-preprod-peering"
  network      = module.service.vpc_self_link
  peer_network = module.preprod.vpc_self_link

  depends_on = [module.service, module.preprod]
}

resource "google_compute_network_peering" "svc_prod_peering" {
  name         = "service-prod-peering"
  network      = module.service.vpc_self_link
  peer_network = module.prod.vpc_self_link

  depends_on = [module.service, module.prod]
}
