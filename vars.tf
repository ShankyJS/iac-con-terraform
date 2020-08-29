variable "digitalocean_token" {
  description = "Token privado para interactuar con la API de Digitalocean"
  type = string
} 

variable "domain_name" {
  description = "Nombre del dominio previamente registrado en Digitalocean"
  type = string
}
variable "record_name" {
  description = "Nombre del registro que vamos a crear en el dominio"
  type = string
}

variable "nombre_llave_ssh" {
  description = "Nombre de la llave SSH que registraremos en Digitalocean"
  type = string
}

variable "llave_ssh_fingerprint" {
  description = "En esta variable almacenaremos el fingerprint de la llave SSH."
  default = "arreeeeeeeeeeeee"
  type = string
}

variable "vm_size" {
  type = map(string)
  description = "(optional) describe your variable"
  default = {
    0 = "s-1vcpu-1gb"
    1 = "s-1vcpu-2gb"
    2 = "s-1vcpu-3gb"
    3 = "s-2vcpu-2gb"
    4 = "s-2vcpu-4gb"
    5 = "s-4vcpu-8gb"
  }
}


# Number, Bool, string