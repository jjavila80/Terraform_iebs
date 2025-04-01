output "db_instance_address" {
  description = "The address of the RDS instance"
  value       = try(aws_db_instance.mydb.address, null)
}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = try(aws_db_instance.mydb.arn, null)
}

output "db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = try(aws_db_instance.mydb.availability_zone, null)
}

output "db_instance_name" {
  description = "The database name"
  value       = try(aws_db_instance.mydb.db_name, null)
}

output "db_instance_engine" {
  description = "The database engine"
  value       = try(aws_db_instance.mydb.engine, null)
}

output "cluster_id" {
  description = "The RDS Cluster Identifier"
  value       = aws_rds_cluster.myclusterdb.id
}
