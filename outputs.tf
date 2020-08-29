output "frontend-server_ipv4" {
  value = "${module.frontend-server.frontend-server_ipv4}"	
}

output "frontend_domain" {
  value = "${module.networking.frontend_domain}"	
}