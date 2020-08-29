resource "digitalocean_ssh_key" "ssh_key" {
  name		    = var.nombre_llave_ssh
  public_key	= file("./secrets/id_rsa.pub")
}