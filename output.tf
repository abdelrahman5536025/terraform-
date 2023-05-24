

output "pub-ip-public1-ec2" {
    value = module.pub1-ec2.ec2-pub-ip
  
}

output "priv-ip-public1-ec2" {
    value = module.pub1-ec2.ec2-priv-ip
  
}

output "pub-ip-public2-ec2" {
    value = module.pub2-ec2.ec2-pub-ip
  
}

output "priv-ip-public2-ec2" {
    value = module.pub2-ec2.ec2-priv-ip
  
}

output "priv-ip-priv1-ec2" {
    value = module.priv1-ec2.priv-ec2-priv-ip
  
}

output "priv-ip-priv2-ec2" {
    value = module.priv2-ec2.priv-ec2-priv-ip
  
}