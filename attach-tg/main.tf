#attach pub2-ec2 to target group
resource "aws_lb_target_group_attachment" "tg-attachement" {
  target_group_arn = var.target_group_arn #aws_lb_target_group.pub-tg.arn
  target_id        = var.target_ec2_id   #aws_instance.pub2-ec2.id
  port             = 80
}