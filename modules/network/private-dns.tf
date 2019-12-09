#
# the resource definition for a private DNS namespace
#

resource "aws_service_discovery_private_dns_namespace" "private" {

  name        = concat("private.", var.environment)
  description = "The private DNS namespace for var.environment"
  vpc         = aws_vpc.default.id
}

#
# end of file
#
