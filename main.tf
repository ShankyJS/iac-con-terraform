provider "digitalocean" {
  token = var.digitalocean_token
}

module "frontend-server" {
  source = "./modules/frontend-server"
  vm_size = var.vm_size[0]
}

module "networking" {
  source = "./modules/networking"
  domain_name = "${var.domain_name}"
  record_name = "${var.record_name}"
  frontend-server_ipv4 = "${module.frontend-server.frontend-server_ipv4}"
}
