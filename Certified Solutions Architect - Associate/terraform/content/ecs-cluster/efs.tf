resource "aws_efs_file_system" "cotb_cluster_file_system" {
  # The file system performance mode.  Default is generalPurpose.
  performance_mode = "generalPurpose"
}

resource "aws_efs_mount_target" "cotb_cluster_mount_target_public_subnets" {
  count = 3

  # The ID of the file system for which the mount target is intended.
  file_system_id  = aws_efs_file_system.cotb_cluster_file_system.id
  # A list of up to 5 VPC security group IDs in effect for the mount target.
  security_groups = [ aws_security_group.cotb_cluster_nfs_sg.id ]
  # The ID of the subnet to add the mount target in.
  subnet_id       = aws_subnet.cotb_cluster_public_subnets[count.index].id
}

output "efs" {
  value = aws_efs_file_system.cotb_cluster_file_system.id
}