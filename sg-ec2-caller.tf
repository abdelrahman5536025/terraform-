module "pub1-ec2"  {
  source = "./ec2"
 
  instance_type = "t2.micro"     
  vpc_security_group_ids = [module.security-group-public-lb.security-group-id]
   
  subnet_id  = module.subnet-pub1.subnet-pub-id       
  ec2-public-ip-or-no = true
  tagofec2 = "pub1-ec22"
  lb-dns = module.private-lb.lb-dns
  

 }

module "pub2-ec2"  {
  source = "./ec2"
 
  instance_type = "t2.micro"     
  vpc_security_group_ids =  [module.security-group-public-lb.security-group-id]
 
  

  subnet_id  = module.subnet-pub2.subnet-pub-id       
  ec2-public-ip-or-no = true
  tagofec2 = "pub2-ec22"
    lb-dns = module.private-lb.lb-dns


}


module "priv1-ec2"  {
  source = "./priv-ec2"
 
  instance_type = "t2.micro"     
  vpc_security_group_ids =  [module.security-group-priv1-ec2.security-group-id]
  
  user_data = file("./install_apache.sh")
  subnet_id  = module.subnet-priv1.subnet-pub-id       
  ec2-public-ip-or-no = false
  depends = [module.pub1-ec2 ]
  tagofec2 = "priv1-ec22"
  


}

module "priv2-ec2"  {
  source = "./priv-ec2"
 
  instance_type = "t2.micro"     
  vpc_security_group_ids = [module.security-group-priv2-ec2.security-group-id]
  
  user_data = file("./install_apache.sh")
  subnet_id  = module.subnet-priv2.subnet-pub-id       
  ec2-public-ip-or-no = false
  depends =  [module.pub2-ec2] 
  tagofec2 = "priv2-ec22"
     


}


module "security-group-priv1-ec2" {
  
  source = "./security-group"
  vpc_id = module.vpc-test.vpc-id
  sec-group-name = "priv1-sec-group"
}





module "security-group-priv2-ec2" {
  
  source = "./security-group"
  vpc_id = module.vpc-test.vpc-id
  sec-group-name = "priv2-sec-group"

}

module "security-group-public-lb" {
  
  source = "./security-group"
  vpc_id = module.vpc-test.vpc-id
  sec-group-name = "public-lb-sec-group"
}

module "security-group-private-lb" {
  
  source = "./security-group"
  vpc_id = module.vpc-test.vpc-id
  sec-group-name = "private-lb-sec-group"
}
