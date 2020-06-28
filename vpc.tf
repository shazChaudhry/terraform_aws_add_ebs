# https://registry.terraform.io/modules/terraform-aws-modules/vpc

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = "vpc"
  cidr   = var.vpc_cidr_block

  enable_dns_hostnames    = true
  enable_dns_support      = true
  map_public_ip_on_launch = true
  enable_dhcp_options     = true
  enable_nat_gateway      = false

  azs             = data.aws_availability_zones.all.names
  public_subnets  = [cidrsubnet(var.vpc_cidr_block, 2, 0)]

  dhcp_options_domain_name         = var.DnsZoneName
  dhcp_options_domain_name_servers = ["AmazonProvidedDNS"]

  dhcp_options_tags = {
    Name = "dhcp"
  }

  vpc_tags = {
    Name = "vpc"
  }

  public_subnet_tags = {
    Name = "public_subnets"
  }

  public_route_table_tags = {
    Name = "public_route_table"
  }

  igw_tags = {
    Name = "igw"
  }

  tags = {
    Terraform   = "true"
    Owner       = "user"
    Environment = "development"
  }
}