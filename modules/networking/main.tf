variable "domain_name" {

}

variable "record_name" {

}

variable "frontend-server_ipv4" {
  
}

# Adding a Record to use it with the Rancher 
resource "digitalocean_record" "frontend_domain" {
  domain      = var.domain_name
  name        = var.record_name
  value       = var.frontend-server_ipv4
  type        = "A"
  ttl         = "30"
}
