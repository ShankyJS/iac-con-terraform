
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
  }

resource "null_resource" "initial_config" {
  connection {
      type = "ssh"
      host = "${digitalocean_droplet.frontend-server.ipv4_address}"
      user = "root"
      private_key = "${file("./secrets/id_rsa")}"
  }

  provisioner "file" {
    source = "./playbooks/install_rke.sh"
    destination = "/root/install_rke.sh"
  }

  provisioner "file" {
    source = "./playbooks/install_docker.sh"
    destination = "/root/install_docker.sh"
  }
  
  provisioner "remote-exec" {
    inline = [
      # Run the operations script.
      ". ./install_rke.sh",
      "rke --version",
      ". ./install_docker.sh",
      "rke up --config cluster-rke.yml"
    ]
  }
}