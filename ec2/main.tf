# Create an EC2 instance  in public subnet 2 
resource "aws_instance" "ec2"  {
  #count = length(var.pub-subnets)
  ami = data.aws_ami.ubuntu_ami.image_id
  instance_type = var.instance_type      
  vpc_security_group_ids = var.vpc_security_group_ids
 
   #depends_on = [var.depends]
  #user_data = var.user_data #"${file("install_nginx.sh")}"
 
  subnet_id  = var.subnet_id
  associate_public_ip_address = var.ec2-public-ip-or-no
  key_name = "terraform"
  
  

  tags = {
    Name = var.tagofec2
  }

  
   provisioner "local-exec" {
    command = <<-EOT
      echo "Private IP of public EC2s is ${self.private_ip}" >> all-ips.txt
      echo "Private IP: ${self.private_ip}"
    EOT
  }
    provisioner "local-exec" {
    command = <<-EOT
      echo "Public IP of public EC2s ${self.public_ip}" >> all-ips.txt
      echo "Public IP: ${self.public_ip}"
    EOT
  }

   provisioner "remote-exec" {
    on_failure = continue
    inline = [ 
        "sudo apt update -y " ,
         "sudo apt install nginx -y " ,
         "sudo systemctl start nginx" ,
         "sudo systemctl enable nginx" ,
         "sudo unlink /etc/nginx/sites-enabled/default",
         "sudo sh -c 'echo \"server { \n listen 80; \n location / { \n proxy_pass http://${var.lb-dns}; \n } \n }\" > /etc/nginx/sites-available/reverse-proxy.conf'" ,
         "sudo ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf" ,
         
         "sudo systemctl restart nginx" 
         #"sudo systemctl enable nginx"

     ]
   
     } 

   connection {
    type = "ssh"
    host = self.public_ip
    user = "ubuntu"
    private_key = file("./terraform.pem") 
    timeout = "3m"
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




