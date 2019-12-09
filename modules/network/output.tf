#
# Module output definitions.
#

output "aws_vpc_id" {
   value = aws_vpc.default.id
}

output "aws_private_dns_id" {
  value = aws_service_discovery_private_dns_namespace.private.id
}

output "aws_private_dns_namespace" {
  value = aws_service_discovery_private_dns_namespace.private.name
}

output "aws_private_dns_zone_id" {
  value = aws_service_discovery_private_dns_namespace.private.hosted_zone
}

output "aws_subnet_public_1_id" {
  value = aws_subnet.public_1.id
}

output "aws_subnet_public_2_id" {
  value = aws_subnet.public_2.id
}

output "aws_subnet_public_3_id" {
  value = aws_subnet.public_3.id
}

output "aws_subnet_private_1_id" {
  value = aws_subnet.private_1.id
}

output "aws_subnet_private_2_id" {
  value = aws_subnet.private_2.id
}

output "aws_subnet_private_3_id" {
  value = aws_subnet.private_3.id
}

output "aws_route_table_vpc_id" {
  value = aws_vpc.default.main_route_table_id
}

output "aws_route_table_public_id" {
  value = aws_route_table.public.id
}

output "aws_route_table_private_id" {
  value = aws_route_table.private.id
}

output "aws_nat_id" {
  value = aws_nat_gateway.nat.id
}

output "aws_nat_public_ip" {
  value = aws_nat_gateway.nat.public_ip
}

#
# end of file
#
