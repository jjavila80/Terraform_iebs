output "vpc_id" {
  value = aws_vpc.demo-vpc.id
}
output "public_1_subnet_id" {
  value = aws_subnet.public_1.id
}

output "public_2_subnet_id" {
  value = aws_subnet.public_2.id
}


output "private_1_subnet_id" {
  value = aws_subnet.private_1.id
}

output "private_2_subnet_id" {
  value = aws_subnet.private_2.id
}

output "private_subnet_group_name" {
  value = aws_db_subnet_group.subn-private.name
}

