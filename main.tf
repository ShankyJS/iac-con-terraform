provider "digitalocean" {
  token = var.digitalocean_token
}

resource "digitalocean_ssh_key" "ssh_key_frontend" {
  name		    = var.nombre_llave_ssh
  public_key	= file("./secrets/id_rsa.pub")
}

module "frontend-server" {
  source = "./modules/frontend-server"
  vm_size = var.vm_size[0]
  llave_ssh_fingerprint = digitalocean_ssh_key.ssh_key_frontend.fingerprint
}

module "networking" {
  source = "./modules/networking"
  domain_name = "${var.domain_name}"
  record_name = "${var.record_name}"
  frontend-server_ipv4 = "${module.frontend-server.frontend-server_ipv4}"
}

