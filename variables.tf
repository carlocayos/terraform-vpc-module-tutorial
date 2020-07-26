variable "aws_region" {
  description = "AWS Region"
}
variable "vpc_cidr_block" {
  description = "Main VPC CIDR Block"
}

variable "availability_zones" {
  type = list(string)
}

variable "public_subnet" {
  type = list(string)
}

variable "private_subnet" {
  type = list(string)
}

variable "database_subnet" {
  type = list(string)
}