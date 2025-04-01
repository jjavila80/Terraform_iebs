output "alb_id" {
  description = "The ID and ARN of the load balancer we created"
  value       = aws_lb.demo-alb.id
}

output "listeners" {
  description = "Map of listeners created and their attributes"
  value       = aws_lb_listener.listener
}

output "target_groups" {
  description = "Map of target groups created and their attributes"
  value       = aws_lb_target_group.demo-target
}


