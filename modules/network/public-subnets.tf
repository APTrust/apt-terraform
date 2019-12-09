#
# Public subnet definitions.
#

#
# Internet gateway for the public subnet
#
resource "aws_internet_gateway" "default" {

  vpc_id = aws_vpc.default.id

  tags = {
    Name        = concat("apt-igw-", var.environment)
    Environment = var.environment
  }
}

#
# Public subnet # 1
#
resource "aws_subnet" "public_1" {

  depends_on = [aws_internet_gateway.default]

  vpc_id                  = aws_vpc.default.id
  cidr_block              = var.public_1_subnet_cidr
  availability_zone = join("",[var.region, "a"])
  map_public_ip_on_launch = true

  tags = {
    Name        = concat("apt-public-sn-1-", var.environment)
    Environment = var.environment
  }
}

#
# Public subnet # 2
#
resource "aws_subnet" "public_2" {

  depends_on = [aws_internet_gateway.default]

  vpc_id                  = aws_vpc.default.id
  cidr_block              = var.public_2_subnet_cidr
  availability_zone = join("",[var.region, "b"])
  map_public_ip_on_launch = true

  tags = {
    Name        = concat("apt-public-sn-2-", var.environment)
    Environment = var.environment
  }
}

#
# Public subnet # 3
#
resource "aws_subnet" "public_3" {

  depends_on = [aws_internet_gateway.default]

  vpc_id                  = aws_vpc.default.id
  cidr_block              = var.public_3_subnet_cidr
  availability_zone = join("",[var.region, "c"])
  map_public_ip_on_launch = true

  tags = {
    Name        = concat("apt-public-sn-3-", var.environment)
    Environment = var.environment
  }
}

#
# Routing table for public subnet
#
resource "aws_route_table" "public" {

  vpc_id = aws_vpc.default.id

  tags = {
    Name        = concat("apt-public-rt-", var.environment)
    Environment = var.environment
  }
}

#
# Route definition
#
resource "aws_route" "public" {

  depends_on = [aws_route_table.public]

  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.default.id
}

#
# Associate the routing table to public subnets
#
resource "aws_route_table_association" "public_1" {

  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {

  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_3" {

  subnet_id      = aws_subnet.public_3.id
  route_table_id = aws_route_table.public.id
}

#
# end of file
#
