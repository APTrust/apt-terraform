#
# Module variable definitions.
#

variable "region" {
  description = "AWS region"
}

variable "environment" {
  description = "Environment name"
  default = "staging"
}

# network definition

variable "vpc_cidr" {
  description = "CIDR for VPC"
}

variable "public_1_subnet_cidr" {
  description = "CIDR for public 1 subnet"
}

variable "public_2_subnet_cidr" {
  description = "CIDR for public 2 subnet"
}

variable "public_3_subnet_cidr" {
  description = "CIDR for public 3 subnet"
}

variable "private_1_subnet_cidr" {
  description = "CIDR for private 1 subnet"
}

variable "private_2_subnet_cidr" {
  description = "CIDR for private 2 subnet"
}

variable "private_3_subnet_cidr" {
  description = "CIDR for private 3 subnet"
}

#
# end of file
#
