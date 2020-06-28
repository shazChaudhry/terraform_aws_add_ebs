# https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance

module "ec2-with-ebs" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                   = "ec2-with-ebs"
  ami                    = data.aws_ami.latest_amzn_ami.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [module.public_sg.this_security_group_id]
  subnet_ids             = module.vpc.public_subnets
  instance_count         = 1
  user_data              = data.template_cloudinit_config.cloud-config-users-and-runcmd.rendered
  # ebs_block_device = [
  #   {
  #     device_name = "/dev/xvdb"
  #     volume_size = 10
  #   }
  # ]

  volume_tags = {
    Name = "Root device"
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
