# --- root/main.tf ---

#Sample Instance Module
module "ec2_instance" {
  source = "./Modules/Compute"
}

#Sample Security Group Module
module "vpc_sg" {
  source              = "./Modules/Security"
  name                = "allow http"
  vpc_id              = "module.vpc.security_group_id"
  ingress_cidr_blocks = ["10.10.0.0/16"]
}


#Same VPC Module
module "vpc" {
  source          = "./Modules/Networking"
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  region          = var.main_region
}

