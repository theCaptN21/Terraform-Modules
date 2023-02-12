output "subnet_id" {
  value = "aws_subnet.modulevpc.id"
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = "module.modulevpc.vpc_cidr_block"
}

output "default_security_group_id" {
  description = "The ID of the security group created by default on VPC creation"
  value       = "module.modulevpc.default_security_group_id"
}


