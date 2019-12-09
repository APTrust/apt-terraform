#
# Private subnet definitions.
#

#
## Private subnet # 1
#
resource "aws_subnet" "private_1" {

  depends_on        = [aws_nat_gateway.nat]

  vpc_id            = aws_vpc.default.id
  cidr_block        = var.private_1_subnet_cidr
  availability_zone = join("",[var.region, "a"])
  map_public_ip_on_launch = false

  tags = {
    Name        = concat("apt-private-sn-1-", var.environment)
    Environment = var.environment
  }
}


#
## Private subnet # 2
#
resource "aws_subnet" "private_2" {

  depends_on        = [aws_nat_gateway.nat]

  vpc_id            = aws_vpc.default.id
  cidr_block        = var.private_2_subnet_cidr
  availability_zone = join("",[var.region, "b"])
  map_public_ip_on_launch = false

  tags = {
    Name        = concat("apt-private-sn-2-", var.environment)
    Environment = var.environment
  }
}

## Private subnet # 3
resource "aws_subnet" "private_3" {

  depends_on        = [aws_nat_gateway.nat]

  vpc_id            = aws_vpc.default.id
  cidr_block        = var.private_3_subnet_cidr
  availability_zone = join("",[var.region, "c"])
  map_public_ip_on_launch = false

  tags = {
    Name        = concat("apt-private-sn-3-", var.environment)
    Environment = var.environment
  }
}

## Routing table for private subnet
resource "aws_route_table" "private" {

  vpc_id = aws_vpc.default.id

  tags = {
    Name        = concat("apt-private-rt-", var.environment)
    Environment = var.environment
  }
}

## Route definition
resource "aws_route" "private" {

  route_table_id              = aws_route_table.private.id
  destination_cidr_block      = "0.0.0.0/0"
  nat_gateway_id              = aws_nat_gateway.nat.id
  depends_on = [aws_route_table.private]
}

#
## Associate the routing table to private subnets
#
resource "aws_route_table_association" "private_1" {

  subnet_id = aws_subnet.private_1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_2" {

  subnet_id = aws_subnet.private_2.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_3" {

  subnet_id = aws_subnet.private_3.id
  route_table_id = aws_route_table.private.id
}

#
# end of file
#
