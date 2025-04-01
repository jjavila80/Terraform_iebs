resource "aws_lb" "demo-alb" {
    name = "demo-alb"
    internal = "false"
    load_balancer_type = "application"
    security_groups = [var.security_group_id]
    subnets = [var.subnet_public_1_id, var.subnet_public_2_id] 

}

resource "aws_lb_target_group" "demo-target" {
    name = "demo-tg"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id
    health_check {
      path = "/health"
      port = 80
      protocol = "HTTP"
    }
}

resource "aws_lb_target_group_attachment" "demo2" {
  target_group_arn = aws_lb_target_group.demo-target.arn
  target_id        = var.instancia_backup_id
  port             = 80 
}


resource "aws_lb_listener" "listener" {
    load_balancer_arn = aws_lb.demo-alb.arn
    port = 80 
    protocol = "HTTP"
    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.demo-target.arn
    }
}
