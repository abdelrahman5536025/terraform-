module "public-tg" {
  source = "./target-group"
  tg-name= "public-target-group"
  vpc_id=module.vpc-test.vpc-id
  
}

module "private-tg" {
  source = "./target-group"
  tg-name= "private-target-group"
  vpc_id=module.vpc-test.vpc-id
  
}


module "attach-pub1-ec2-to-pubtg" {
  source="./attach-tg"
  target_group_arn =module.public-tg.target-group-arn
  target_ec2_id = module.pub1-ec2.ec2-id
  
  
}

module "attach-pub2-ec2-to-pubtg" {
  source="./attach-tg"
  target_group_arn =module.public-tg.target-group-arn
  target_ec2_id = module.pub2-ec2.ec2-id
  
  
}

module "attach-priv1-ec2-to-privtg" {
  source="./attach-tg"
  target_group_arn =module.private-tg.target-group-arn
  target_ec2_id = module.priv1-ec2.priv-ec2-id
  
  
}

module "attach-priv2-ec2-to-privtg" {
  source="./attach-tg"
  target_group_arn =module.private-tg.target-group-arn
  target_ec2_id = module.priv2-ec2.priv-ec2-id
  
  
}


module "public-lb" {
  source = "./load-balancer"
  name= "public-load-balancer"
  bol=false
  security-group =module.security-group-public-lb.security-group-id
  #security-group-public-lb
  subnets = [module.subnet-pub1.subnet-pub-id , module.subnet-pub2.subnet-pub-id]
    
  
}

module "private-lb" {
  source = "./load-balancer"
  name= "private-load-balancer"
  bol=true
  security-group =module.security-group-private-lb.security-group-id
  #security-group-public-lb
  subnets = [module.subnet-priv1.subnet-pub-id , module.subnet-priv2.subnet-pub-id]
    
  
}


module "public-listener" {
  source = "./listener"
  load_balancer_arn=module.public-lb.lb-arn
  target_group_arn=module.public-tg.target-group-arn
  
}

module "private-listener" {
  source = "./listener"
  load_balancer_arn=module.private-lb.lb-arn
  target_group_arn=module.private-tg.target-group-arn
  
}





