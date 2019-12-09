#
# NAT definitions for our infrastructure
#

/* Create elastic IP */
resource "aws_eip" "eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.default]

  tags = {
    Name        = concat("apt-eip-nat-", var.environment)
    Environment = var.environment
  }
}

/* NAT gateway */
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id = aws_subnet.public_1.id
  depends_on = [aws_internet_gateway.default]

  tags = {
    Name        = concat("apt-natgw-", var.environment)
    Environment = var.environment
  }
}

#
# end of file
#
