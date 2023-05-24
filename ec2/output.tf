output "ec2-id" {
    value = aws_instance.ec2.id
  
}

output "ec2-pub-ip" {
    value = aws_instance.ec2.public_ip
  
}

output "ec2-priv-ip" {
    value = aws_instance.ec2.private_ip
  
}