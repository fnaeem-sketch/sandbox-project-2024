resource "aws_efs_file_system" "dev-efs" {
  creation_token = "my-product"
  encrypted      = true

  tags = {
    Name = "dev-efs"
  }
}

resource "aws_efs_mount_target" "dev-efs-mount-target-1" {
  file_system_id  = aws_efs_file_system.dev-efs.id
  subnet_id       = aws_subnet.private-database-subnet-az-1.id
  security_groups = [var.nfs_sg_id]
}

resource "aws_efs_mount_target" "dev-efs-mount-target-2" {
  file_system_id  = aws_efs_file_system.dev-efs.id
  subnet_id       = aws_subnet.private-database-subnet-az-2.id
  security_groups = [var.nfs_sg_id]
}

