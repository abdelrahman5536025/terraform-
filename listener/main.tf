# listener to the public load balancer

resource "aws_lb_listener" "listener" {
  load_balancer_arn = var.load_balancer_arn  #aws_lb.public-lb.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = var.target_group_arn  #aws_lb_target_group.pub-tg.arn
  }
}