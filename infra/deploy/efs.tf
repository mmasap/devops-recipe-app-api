resource "aws_efs_file_system" "media" {
  encrypted = true
  tags = {
    Name = "${local.prefix}-media"
  }
}

resource "aws_security_group" "efs" {
  name   = "${local.prefix}-efs"
  vpc_id = aws_vpc.main.id
  ingress {
    protocol        = "tcp"
    from_port       = 2049
    to_port         = 2049
    security_groups = [aws_security_group.ecs_service.id]
  }
  egress {
    protocol    = "tcp"
    from_port   = 2049
    to_port     = 2049
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${local.prefix}-efs"
  }
}

resource "aws_efs_mount_target" "media_a" {
  file_system_id = aws_efs_file_system.media.id
  subnet_id      = aws_subnet.private_a.id
  security_groups = [
    aws_security_group.efs.id
  ]
}

resource "aws_efs_mount_target" "media_c" {
  file_system_id = aws_efs_file_system.media.id
  subnet_id      = aws_subnet.private_c.id
  security_groups = [
    aws_security_group.efs.id
  ]
}

resource "aws_efs_access_point" "media" {
  file_system_id = aws_efs_file_system.media.id
  root_directory {
    path = "/api/media"
    creation_info {
      owner_gid   = 101
      owner_uid   = 101
      permissions = "755"
    }
  }
}
