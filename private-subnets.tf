resource "aws_subnet" "private-application-subnet-az-1" {
  vpc_id            = aws_vpc.dev-vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"


  tags = {
    Name = "private-app-subnet-az-1"
  }
}

resource "aws_subnet" "private-database-subnet-az-1" {
  vpc_id            = aws_vpc.dev-vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "private-database-subnet-az-1"
  }
}

resource "aws_subnet" "private-application-subnet-az-2" {
  vpc_id            = aws_vpc.dev-vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1b"


  tags = {
    Name = "private-app-subnet-az-2"
  }
}

resource "aws_subnet" "private-database-subnet-az-2" {
  vpc_id            = aws_vpc.dev-vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "private-database-subnet-az-2"
  }
}