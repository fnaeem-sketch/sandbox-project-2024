
resource "aws_subnet" "public-subnet-az-1" {
  vpc_id                  = aws_vpc.dev-vpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true


  tags = {
    Name = "public-subnet-az-1a"
  }
}


resource "aws_subnet" "public-subnet-az-2" {
  vpc_id                  = aws_vpc.dev-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true


  tags = {
    Name = "public-subnet-az-1b"
  }
}

