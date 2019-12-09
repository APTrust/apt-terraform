#
# A common set of deny ACL's
#


locals {
  allow = [
    "0.0.0.0/0"                // the default, allow all ingress and egress
  ]
  deny = [
    "91.247.38.0/24"           // 2019-02-25 booktraces api attack
  ]
}

resource "aws_network_acl" "public-acl" {

  count      = length( local.deny)
  vpc_id     = aws_vpc.default.id
  subnet_ids = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id,
  ]

  tags = {
    Name        = concat("apt-public-sn-acl-", var.environment)
    Environment = var.environment
  }
}

resource "aws_network_acl_rule" "inbound-allow" {

  count          = length( local.allow)
  network_acl_id = aws_network_acl.public-acl.id

  rule_number  = 1000 + count.index
  egress       = false
  protocol     = "-1"
  rule_action  = "allow"
  cidr_block   =  element( local.allow, count.index )
  from_port    = 0
  to_port      = 0
}

resource "aws_network_acl_rule" "outbound-allow" {

  count          = length( local.allow)
  network_acl_id = aws_network_acl.public-acl.id

  rule_number  = 1000 + count.index
  egress       = true
  protocol     = "-1"
  rule_action  = "allow"
  cidr_block   =  element( local.allow, count.index )
  from_port    = 0
  to_port      = 0
}

resource "aws_network_acl_rule" "inbound-deny" {

  count          = length( local.deny)
  network_acl_id = aws_network_acl.public-acl.id

  rule_number  = 999 - count.index
  egress       = false
  protocol     = "-1"
  rule_action  = "deny"
  cidr_block   =  element( local.deny, count.index )
  from_port    = 0
  to_port      = 0
}

#
# end of file
#
