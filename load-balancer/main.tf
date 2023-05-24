#connect "public" load balancer to pub-sub1 and pub-sub2

resource "aws_lb" "lb" {
  name               =  var.name #"public-lb-tf"
  internal           = var.bol
  load_balancer_type = "application"
  security_groups    = [var.security-group] #aws_security_group.pub-lb-sg.id
  #subnets = ["${aws_subnet.pub-sub1.id}", "${aws_subnet.pub-sub2.id}"]
  #subnets = [aws_subnet.pub-sub1.id, aws_subnet.pub-sub2.id]
  subnets = var.subnets

  #enable_deletion_protection = true


  tags = {
    Environment = "production"
  }
}