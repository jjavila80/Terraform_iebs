# Recursos de red
module "network-resources" {
  source = "./modules/vpc"
  vpc_id = module.network-resources.vpc_id
  environment = var.env
}


# Recursos de seguridad
module "security-resources" {
  source = "./modules/sg"
  vpc_id = module.network-resources.vpc_id
  environment = var.env
}

#Recursos de instanciacias ec2
module "ec2-resources" {
  source = "./modules/ec2"
  environment = var.env

  vpc_id = module.network-resources.vpc_id
  security_group_id = module.security-resources.security_group_id_ec2
  public_subnet_1_id = module.network-resources.public_1_subnet_id
  public_subnet_2_id = module.network-resources.public_2_subnet_id
}

#Recurso de BBDD RDS Mysql
module "rds-resources" {
  source = "./modules/rds"
  environment = var.env

  vpc_id = module.network-resources.vpc_id
  security_group_ids = module.security-resources.security_group_id_rds
  db_subnet_group_name = module.network-resources.private_subnet_group_name

}

#Recurso ALB
module "alb-resources" {
  source = "./modules/alb"
  environment = var.env

  vpc_id = module.network-resources.vpc_id
  security_group_id = module.security-resources.security_group_id_ec2
  subnet_public_1_id = module.network-resources.public_1_subnet_id
  subnet_public_2_id = module.network-resources.public_2_subnet_id
  instancia_backup_id = module.ec2-resources.instancia_id_webserver_2
}




#Recursos de almacenamiento externo Bucket S3
module "bucket-resources" {
  source="./modules/s3"
  environment = var.env   
}



