//Public route table
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.dev-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

//public route table associations
resource "aws_route_table_association" "public-association-1" {
  subnet_id      = aws_subnet.public-subnet-az-1.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "public-association-2" {
  subnet_id      = aws_subnet.public-subnet-az-2.id
  route_table_id = aws_route_table.public-route-table.id
}

//Private route tables
resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.dev-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gateway-az-1.id
  }

  tags = {
    Name = "private-route-table"
  }
}

//Private route table associations
resource "aws_route_table_association" "private-association-1" {
  subnet_id      = aws_subnet.private-application-subnet-az-1.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "private-association-2" {
  subnet_id      = aws_subnet.private-application-subnet-az-2.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "private-association-3" {
  subnet_id      = aws_subnet.private-database-subnet-az-1.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "private-association-4" {
  subnet_id      = aws_subnet.private-database-subnet-az-2.id
  route_table_id = aws_route_table.private-route-table.id
}


