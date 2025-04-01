output "security_group_id_ec2" {
  description = "The ID of the security group"
  value = aws_security_group.http_access.id
}

output "security_group_name_ec2" {
  description = "The name of the security group"
  value = aws_security_group.http_access.name
}

output "security_group_id_rds" {
  description = "The ID of the security group"
  value = aws_security_group.rds-sg.id
}

output "security_group_name_rds" {
  description = "The name of the security group"
  value = aws_security_group.rds-sg.name
}

