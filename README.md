# conociendo-iac-con-terraform
Repositorio utilizado para Charla denominada "Infraestructura como código con Terraform".

## Terraform version

Este proyecto fue realizado en Terraform version 

````
Terraform v0.12.18
+ provider.digitalocean v1.22.2
+ provider.null v2.1.2
+ provider.template v2.1.2
````

## Instalación de Terraform

Recomiendo mucho instalar Terraform a través de "tfenv" debido que nos permite gestionar las versiones de Terraform y es usable en MacOS, Unix based systems y Windows (Git-bash)

[Click para acceder al repositorio](https://github.com/tfutils/tfenv)

## Cumple los requisitos para correr la demo

Requisitos:

- Cuenta en Digitalocean [registrate aquí.](m.do.co/c/e3c4799e0fa4)
- Crear un Personal Access Token [documentación aquí](www.digitalocean.com/docs/apis-clis/api/create-personal-access-token/)

## Clona el repositorio

Clona el repositorio en tu local

````
git clone https://github.com/ShankyJS/iac-con-terraform
````

## Preparandonos para correr el proyecto

Entra a la carpeta "secrets" y genera una llave ssh y dejala con el nombre por defecto (id_rsa)

````
cd secrets
ssh-keygen -t rsa -b 4096 -C "demo@shanky-demos.com" -f $PWD/id_rsa
````

Deberias de tener los siguientes archivos en tu carpeta secrets:

````
 2020-08-29 17:04:10 ⌚  shanky in ~/Documents/OS/Speaking/iac-con-terraform/secrets
 → ls 
id_rsa  id_rsa.pub
````

### Crea tu archivo de variables y llenalo.

Copia la plantilla de variables en un nuevo archivo y llenalas con los valores especificos que utilizarás.

````
cp terraform.tfvars.example terraform.tfvars
````

Modifica el archivo ``terraform.tfvars`` y reemplaza las "XXXXX" por los valores de tus variables.

### Inicializa, crea y destruye

Inicializa el proyecto, esto hará que Terraform descargue los módulos y providers necesarios.

(Corre estos comandos desde el root del repositorio)

````
terraform init
````

Luego de inicializar el proyecto puedes planearlo para ver que recursos serán creados.

````
terraform plan
````

Si estás de acuerdo con los recursos que serán creados puedes aplicar estos cambios.

````
terraform apply --auto-approve
````

Una vez que termines de probar el proyecto puedes destruirlo.

````
terraform destroy --auto-approve
````