variable "region_aws" {
	description = "Region AWS"
        default = "eu-west-3" #Paris 
}

variable "env"{
        description = "Entorno de despliegue"
        default = "Dev" #Desarrollo

}

variable "project" {
  description = "Project Name or service"
  default = "Automatizacion de Infraestructura con Terraform"
}


