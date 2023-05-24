#create an elastic ip to be used by the nat gateway
resource "aws_eip" "main" {
  vpc = true
}

#create a nat gateway in the public subnet
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.main.id
  subnet_id     = var.subnet_id              #aws_subnet.pub-sub1.id
  
}

# private route table to connect nat gateway with
resource "aws_route_table" "nat" {
  vpc_id = var.vpc_id  #aws_vpc.main.id

  route {
    cidr_block = var.cidr_block
    #gateway_id = aws_internet_gateway.main.id
    nat_gateway_id = aws_nat_gateway.main.id

  }

  
  tags = {
    Name = var.tagof-priv-route-table
  }
}

