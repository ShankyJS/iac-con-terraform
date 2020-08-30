
variable "vm_size" {

}

variable "llave_ssh_fingerprint" {

}

resource "digitalocean_droplet" "frontend-server" {
  image       = "ubuntu-18-04-x64"
  name        = "frontend-server"
  region      = "sfo2"
  size        = var.vm_size
  ssh_keys    = [var.llave_ssh_fingerprint]

  connection {
    type = "ssh"
    host = digitalocean_droplet.frontend-server.ipv4_address
    user = "root"
    private_key = file("./secrets/id_rsa")
  }

  provisioner "file" {
    source = "./playbooks/dependencies.yaml"
    destination = "/root/dependencies.yaml"
  }
  
  provisioner "file" {
    source = "./playbooks/create-react-app.sh"
    destination = "/root/create-react-app.sh"
  }

}

resource "null_resource" "initial_config" {
  depends_on = [digitalocean_droplet.frontend-server]

  connection {
      type = "ssh"
      host = digitalocean_droplet.frontend-server.ipv4_address
      user = "root"
      private_key = file("./secrets/id_rsa")
  }
  
  provisioner "remote-exec" {
    inline = [
      # Run the operations script.
      "sudo apt-get update",
      "sudo apt-get -y install ansible",
      "ansible-playbook dependencies.yaml"
    ]
  }
}

resource "null_resource" "react_project_creation" {
  depends_on = [null_resource.initial_config]
  connection {
      type = "ssh"
      host = digitalocean_droplet.frontend-server.ipv4_address
      user = "root"
      private_key = file("./secrets/id_rsa")
  }
  
  provisioner "remote-exec" {
    inline = [
      # Run the React script.
      ". ./create-react-app.sh",
      "cp /root/react_frontend.com /etc/nginx/sites-available/react_frontend.com",
      "ln -s /etc/nginx/sites-available/react_frontend.com /etc/nginx/sites-enabled/react_frontend.com",
      "sudo systemctl restart nginx"
    ]
  }
}