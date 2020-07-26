aws_region         = "ap-southeast-1"
vpc_cidr_block     = "10.0.0.0/16"
availability_zones = ["ap-southeast-1a", "ap-southeast-1b"]
public_subnet      = ["10.0.0.0/24", "10.0.1.0/24"]
private_subnet     = ["10.0.101.0/24", "10.0.102.0/24"]
database_subnet    = ["10.0.201.0/24", "10.0.202.0/24"]