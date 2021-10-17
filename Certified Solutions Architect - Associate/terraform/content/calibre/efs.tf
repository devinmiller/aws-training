resource "aws_efs_file_system" "cotb_dev_calibre_file_system" {
  # The file system performance mode.  Default is generalPurpose.
  performance_mode = "generalPurpose"
}

resource "aws_efs_mount_target" "mount_target_subnet_one" {
  # The ID of the file system for which the mount target is intended.
  file_system_id  = aws_efs_file_system.cotb_dev_calibre_file_system.id
  # A list of up to 5 VPC security group IDs in effect for the mount target.
  security_groups = [ aws_security_group.cotb_dev_web_sg.id ]
  # The ID of the subnet to add the mount target in.
  subnet_id       = aws_subnet.cotb_dev_subnet_public.id
}