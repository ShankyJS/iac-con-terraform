output "frontend-server_ipv4" {
  value = "${module.frontend-server.frontend-server_ipv4}"	
}

output "frontend_domain" {
  value = "${module.networking.frontend_domain}"	
}

output "llave_ssh_id" {
  value = digitalocean_ssh_key.ssh_key.fingerprint
}