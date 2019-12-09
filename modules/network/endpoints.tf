#
# Create some VPC endpoints... only S3 for now
#

# resource "aws_vpc_endpoint" "s3" {
#
#   vpc_id          = aws_vpc.default.id
#   service_name    = "com.amazonaws.var.region.s3"
#   route_table_ids = [ aws_route_table.private.id ]
#
#   policy = <<POLICY
# {
#     "Version": "2008-10-17",
#     "Statement": [
#         {
#             "Action": "*",
#             "Effect": "Allow",
#             "Resource": "*",
#             "Principal": "*"
#         }
#     ]
# }
# POLICY
#
#   tags = {
#     Name        = uva-vpc-endpoint-s3-var.environment
#     Environment = var.environment
#   }
# }

//resource "aws_vpc_endpoint_route_table_association" "s3" {
//
//  route_table_id  = aws_vpc.default.main_route_table_id
//  vpc_endpoint_id = aws_vpc_endpoint.s3.id
//}

#
# end of file
#
