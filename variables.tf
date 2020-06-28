variable "region" {
  type        = string
  description = "Region to be set either in an environment specific file or default values to come from terraform.tfvars file"
}

variable "instance_type" {
  type        = string
  description = "Define EC2 instance type"
}

variable "vpc_cidr_block" {
  type = string
  description = "Define VPC cidr block"
}

variable "DnsZoneName" {
  type        = string
  description = "Define DnsZoneName"
}

variable "public_key" {
  description = "This value is set in cloud-init in data.tf file. See README"
}