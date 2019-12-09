#
# VPC definition.
#

resource "aws_vpc" "default" {

  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name        = concat("apt-vpc-", var.environment)
    Environment = var.environment
  }
}

#
# end of file
#
