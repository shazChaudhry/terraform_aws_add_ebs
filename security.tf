  
# https://registry.terraform.io/modules/terraform-aws-modules/security-group

module "public_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "public-sg"
  description = "public SG"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"] # This range should ideally be limited to say your home address
  ingress_rules       = ["ssh-tcp"]
  egress_rules        = ["all-all"]

  tags = {
    Name        = "public-sg"
    Terraform   = "true"
    Environment = "dev"
  }
}