# Configuración del proveedor AWS
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region =  "${var.region_aws}" # "eu-west-3" Paris
}

# Configuración de terraform cloud
terraform {
  cloud {

    organization = "JJAVILA"

    workspaces {
      name = "Terraform"
    }
  }
}
