resource "aws_ebs_encryption_by_default" "encryption" {
  enabled = true
}

resource "aws_ebs_volume" "volume" {
  availability_zone = tolist(module.ec2-with-ebs.availability_zone)[0]
  size              = 40

  tags = {
    Name = "Additional device"
  }
}

resource "aws_volume_attachment" "attachment" {
  device_name = "/dev/xvdb"
  volume_id   = aws_ebs_volume.volume.id
  instance_id = tolist(module.ec2-with-ebs.id)[0] # it is first item in the list of instances becuase instance_count has been set to 1
}