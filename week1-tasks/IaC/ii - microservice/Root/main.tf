# # # # # NETWORKING # # # # #

# VPC
module "vpc" {
  source = "../Module/vpc"
  vpc_cider_block = var.vpc_cider_block
}

# AZ
module "az" {
  source = "../Module/availability_zone"
}


# SUBNETS
module "subnets" {
  source = "../Module/subnets"
  vpc_id = module.vpc.vpc_id
  private_subnet = var.private_subnet
  public_subnet = var.public_subnet
  random_az = module.az.random_az
}

# NAT GATEWAY
module "nat_gateway" {
  source = "../Module/nat_gateway"
  public_subnet_id = module.subnets.public_subnet_id
}


# INTERNET GATEWAY
module "internet_gateway" {
  source = "../Module/internet_gateway"
  vpc_id = module.vpc.vpc_id
}

# ROUTING
module "routing" {
  source = "../Module/routing"
  vpc_id = module.vpc.vpc_id
  private_destination_cider = var.private_destination_cider
  public_destination_cider =  var.public_destination_cider
  public_subnet_id = module.subnets.public_subnet_id
  private_subnet_id = module.subnets.private_subnet_id
  nat_gateway_id = module.nat_gateway.nat_gateway_id
  ig_id = module.internet_gateway.ig_id
 }

# SECURITY GROUP
module "security_group" {
  source = "../Module/security_group"
  vpc_id = module.vpc.vpc_id
}


# NACL   NEED CHANGES HERE
module "nacl" {
  source = "../Module/nacl"
  vpc_id = module.vpc.vpc_id
  private_subnet_id = module.subnets.private_subnet_id
  public_subnet_id = module.subnets.public_subnet_id
}


# EC2 KEY PAIR
module "key_pair" {
  source = "../Module/ec2_keypair"
}

# VPC ENDPOINT FOR EC2
module "vpc_endpoint" {
  source = "../Module/endpoint"
  vpc_id = module.vpc.vpc_id
  private_subnet_id = module.subnets.private_subnet_id
  sg_id = module.security_group.sg_id
  region = var.region
}

# EC2 INSTANCE
module "ec2_instance" {
  source = "../Module/ec2"
  public_key = module.key_pair.public_key
  public_subnet_id = module.subnets.public_subnet_id
  sg_id = module.security_group.sg_id
  private_subnet_id = module.subnets.private_subnet_id
}
