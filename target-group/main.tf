#create public target group 
resource "aws_lb_target_group" "target-group" {
  name     = var.tg-name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

