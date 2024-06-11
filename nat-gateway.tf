resource "aws_nat_gateway" "nat-gateway-az-1" {
  allocation_id = aws_eip.nat-gateway-eip.id
  subnet_id     = aws_subnet.public-subnet-az-1.id

  tags = {
    Name = "nat-gateway-az-1"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  # depends_on = [aws_internet_gateway.example]
}

resource "aws_eip" "nat-gateway-eip" {
  domain = "vpc"

  tags = {
    Name = "nat-gateway-eip-az-1"
  }
}