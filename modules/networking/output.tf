output "frontend_domain" {
  value = "${digitalocean_record.frontend_domain.fqdn}"	
}
