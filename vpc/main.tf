provider "aws" {
  region = "us-east-1"


}

# Create a VPC
resource "aws_vpc" "vpc" {
  cidr_block =var.vpc_block

}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id
  
}

#connect  public route table to internet gateway 
resource "aws_route_table" "main-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.block-of-route-table
    gateway_id = aws_internet_gateway.igw.id
  }

  # route {
  #   ipv6_cidr_block = var.routeanywhere[1]
  #   gateway_id = aws_internet_gateway.main.id
  # }

  tags = {
    Name = "public_routetable"
  }
}

# #create public target group 
# resource "aws_lb_target_group" "target-group" {
#   name     = var.nameof-target-group #"tf-public-lb-tg"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = aws_vpc.vpc.id
# }