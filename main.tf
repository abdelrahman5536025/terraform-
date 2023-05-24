resource "aws_instance" "priv-ec2"  {
  #count = length(var.pub-subnets)
  ami = data.aws_ami.ubuntu_ami.image_id
  instance_type = var.instance_type      
  vpc_security_group_ids = var.vpc_security_group_ids
 
  depends_on = [var.depends]
  user_data = var.user_data #"${file("install_nginx.sh")}"
 
  subnet_id  = var.subnet_id
  associate_public_ip_address = var.ec2-public-ip-or-no
  key_name = "terraform"
  
  

  tags = {
    Name = var.tagofec2
  }
 
  provisioner "local-exec" {
    command = <<-EOT
      echo "Private IP for private EC2s ${self.private_ip}" >> all-ips.txt
      echo "Private IP: ${self.private_ip}"
    EOT
  }



}

data "aws_ami" "ubuntu_ami" {
  most_recent = true
  owners =["amazon"]

   filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-*-server-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}