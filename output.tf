output "vpc_id_main" {
  value = module.network-resources.vpc_id
}
output "public_1_subnet" {
  value = module.network-resources.public_1_subnet_id
}

output "public_2_subnet" {
  value = module.network-resources.public_2_subnet_id
}


output "private_1_subnet" {
  value = module.network-resources.private_1_subnet_id
}

output "private_2_subnet" {
  value = module.network-resources.private_2_subnet_id
}


output "security_group_ec2_id" {
      value = module.security-resources.security_group_id_ec2
}

output "security_group_rds_id" {
      value = module.security-resources.security_group_id_rds
}


output "secutiry_group_ec2_name"{
      value = module.security-resources.security_group_name_ec2
}

output "secutiry_group_rds_name"{
      value = module.security-resources.security_group_name_rds
}


output "s3_bucket_name" {
      value = module.bucket-resources.bucket_name
}


output "instancia_id_webserver_1" {
  value = module.ec2-resources.instancia_id_webserver_1
}

output "instancia_ip_webserver_1" {
  value = module.ec2-resources.instancia_ip_webserver_1
}

output "ec2_complete_arn_webserver_1" {
  value       = module.ec2-resources.ec2_complete_arn_webserver_1
}

output "instancia_id_webserver_2" {
  value = module.ec2-resources.instancia_id_webserver_2
}

output "instancia_ip_webserver_2" {
  value = module.ec2-resources.instancia_ip_webserver_2
}

output "ec2_complete_arn_webserver_2" {
  value       = module.ec2-resources.ec2_complete_arn_webserver_2
}



output "db_instance_address" {
  value       = module.rds-resources.db_instance_address
}

output "db_instance_availability_zone" {
  value       = module.rds-resources.db_instance_availability_zone
}

output "db_instance_engine" {
  value       = module.rds-resources.db_instance_engine
}

output "cluster_id" {
  value       = module.rds-resources.cluster_id
}

output "alb_id" {
  value       = module.alb-resources.alb_id
}
