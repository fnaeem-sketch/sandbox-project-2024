resource "aws_ec2_instance_connect_endpoint" "dev-ec2-ice" {
  subnet_id          = aws_subnet.private-application-subnet-az-2.id
#   vpc_id             = var.vpc_id
  security_group_ids = var.security_group_id
}