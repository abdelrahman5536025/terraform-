module "vpc-test" {
  source = "./vpc"
  vpc_block = "10.0.0.0/16"
  block-of-route-table = "0.0.0.0/0"
  
  
}

module "subnet-pub1" {
  source = "./subnet"
  vpc_id = module.vpc-test.vpc-id
  subnet_cidr = "10.0.0.0/24"
  tagofsubnet  = "public-subnet1"
  az = "us-east-1a"

  
}

module "subnet-pub2" {
  source = "./subnet"
  vpc_id = module.vpc-test.vpc-id
  subnet_cidr = "10.0.2.0/24"
  tagofsubnet  = "public-subnet2"
  az = "us-east-1b"
  
  
}

module "subnet-priv1" {
  source = "./subnet"
  vpc_id = module.vpc-test.vpc-id
  subnet_cidr = "10.0.1.0/24"
  tagofsubnet  = "private-subnet1"
  az = "us-east-1a"
  
  
}

module "subnet-priv2" {
  source = "./subnet"
  vpc_id = module.vpc-test.vpc-id
  subnet_cidr = "10.0.3.0/24"
  tagofsubnet  = "private-subnet2"
  az = "us-east-1b"
  
  
}

module "assoc-subnet-pub1" {
  source = "./route-tables-assoc"
  subnet_id =module.subnet-pub1.subnet-pub-id
  route_table_id=module.vpc-test.pub-route-table-id
  
}

module "assoc-subnet-pub2" {
  source = "./route-tables-assoc"
  subnet_id =module.subnet-pub2.subnet-pub-id
  route_table_id=module.vpc-test.pub-route-table-id
  
}


module "nat-priv-route-table" {
  source = "./nat-eip-privroute"
  subnet_id=module.subnet-pub1.subnet-pub-id
  vpc_id=module.vpc-test.vpc-id
  tagof-priv-route-table="private-routetable"
  cidr_block= "0.0.0.0/0"
}

module "nat-priv1-subnet" {
  source = "./route-tables-assoc"
  subnet_id =module.subnet-priv1.subnet-pub-id
  route_table_id=module.nat-priv-route-table.route-table-id
  
}

module "nat-priv2-subnet" {
  source = "./route-tables-assoc"
  subnet_id =module.subnet-priv2.subnet-pub-id
  route_table_id=module.nat-priv-route-table.route-table-id
  
}


