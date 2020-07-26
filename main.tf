#-------------------------------
# AWS Provider
#-------------------------------
provider "aws" {
  region = var.aws_region
}

#-------------------------------
# AWS VPC
#-------------------------------
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.44.0"

  name = "my-vpc-terraform-module-${terraform.workspace}"
  cidr = var.vpc_cidr_block

  azs              = var.availability_zones
  public_subnets   = var.public_subnet
  private_subnets  = var.private_subnet
  database_subnets = var.database_subnet

  create_igw         = true
  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Terraform   = "true"
    Environment = terraform.workspace
  }
}