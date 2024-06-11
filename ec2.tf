resource "aws_instance" "my-dev-ec2" {
  ami                         = "ami-08a0d1e16fc3f61ea" #Amazon Linux 2023 AMI 
  instance_type               = "t2.medium"
  vpc_security_group_ids      = [var.app_server_sg_id]
  subnet_id                   = aws_subnet.private-application-subnet-az-1.id
  associate_public_ip_address = false

  tags = {
    Name = "my-dev-ec2"
  }
}
