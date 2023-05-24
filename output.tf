output "priv-ec2-id" {
    value = aws_instance.priv-ec2.id
  
}

output "priv-ec2-pub-ip" {
    value = aws_instance.priv-ec2.public_ip
  
}

output "priv-ec2-priv-ip" {
    value = aws_instance.priv-ec2.private_ip
  
}