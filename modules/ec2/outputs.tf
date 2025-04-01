output "instancia_id_webserver_1" {
  value = aws_instance.webserver-ec2-1.id
}

output "instancia_ip_webserver_1" {
  value = aws_instance.webserver-ec2-1.public_ip
}

output "ec2_complete_arn_webserver_1" {
  value       = aws_instance.webserver-ec2-1.arn
}

output "instancia_id_webserver_2" {
  value = aws_instance.webserver-ec2-2.id
}

output "instancia_ip_webserver_2" {
  value = aws_instance.webserver-ec2-2.public_ip
}

output "ec2_complete_arn_webserver_2" {
  value       = aws_instance.webserver-ec2-2.arn
}

