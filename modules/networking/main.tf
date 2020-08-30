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

resource "template_file" "nginx_frontend" {
  depends_on = ["digitalocean_record.frontend_domain"]
  template = "${file("./playbooks/nginx-template")}"
  vars = {
    frontend_domain = digitalocean_record.frontend_domain.fqdn
  }
}

resource "null_resource" "adding_template" {
  connection {
    type = "ssh"
    host = digitalocean_record.frontend_domain.fqdn
    user = "root"
    private_key = file("./secrets/id_rsa")
  }

  provisioner "file" {
    content = "${template_file.nginx_frontend.rendered}"
    destination = "/root/react_frontend.com"
  }
}
