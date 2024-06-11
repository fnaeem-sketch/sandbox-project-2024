# 5 security groups below 
# 1. ALB SG
# 2. EC2 Instance Connect Endpoint SG
# 3. App server security group SG
# 4. Database securiuty group
# 5. EFS security group 

# 1. ALB SG
resource "aws_security_group" "alb_sg" {
  name        = "alb-security-group"
  description = "Security group for ALB to allow web traffic"
  vpc_id      = var.vpc_id

  # Allow HTTP
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTPS
  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ALB Security Group"
  }
}

# 2. EC2 Instance Connect Endpoint SG
resource "aws_security_group" "ec2_connect_sg" {
  name        = "ec2-instance-connect-sg"
  description = "Security group for EC2 Instance Connect endpoint allowing SSH from within VPC"
  vpc_id      = var.vpc_id

  # Allow outbound traffic on port 22 from CIDR block of vpc
  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  tags = {
    Name = "EC2 Instance Connect SG"
  }
}

# 3. App server security group SG
resource "aws_security_group" "app_server_sg" {
  name        = "app-server-sg"
  description = "Security group for application server"
  vpc_id      = var.vpc_id

  # Ingress rule for HTTP and HTTPS from ALB Security Group
  ingress {
    description     = "HTTP from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [var.alb_sg_id]
  }

  ingress {
    description     = "HTTPS from ALB"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [var.alb_sg_id]
  }

  # Ingress rule for SSH from EC2 Instance Connect Security Group
  ingress {
    description     = "SSH from EC2 Instance Connect SG"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [var.ec2_connect_sg_id]
  }

  # Default egress rule to allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Application Server SG"
  }
}

# 4. Database securiuty group
resource "aws_security_group" "db_sg" {
  name        = "db-security-group"
  description = "Security group for MySQL database"
  vpc_id      = var.vpc_id

  ingress {
    description     = "MySQL from App Servers"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.app_server_sg_id]
  }

  # Egress rule to allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Database SG"
  }
}

# 5. EFS security group 
resource "aws_security_group" "efs_sg" {
  name        = "efs-security-group"
  description = "Security group for EFS, allowing NFS and SSH access"
  vpc_id      = var.vpc_id

  # Ingress rule for NFS (EFS) from Application Servers
  ingress {
    description     = "NFS access from application servers"
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    security_groups = [var.app_server_sg_id]
  }

  # Ingress rule for SSH from EC2 Instance Connect
  ingress {
    description     = "SSH access from EC2 Instance Connect"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [var.ec2_connect_sg_id]
  }

 # Ingress rule for NFS access from NFS SG
  ingress {
    description      = "NFS access from NFS SG"
    from_port        = 2049
    to_port          = 2049
    protocol         = "tcp"
    security_groups  = [var.nfs_sg_id]
  }

  # Egress rule to allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "EFS Security Group"
  }
}


