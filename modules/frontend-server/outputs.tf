# Using this output as a variable
output "frontend-server_ipv4" {
  value = digitalocean_droplet.frontend-server.ipv4_address	
}