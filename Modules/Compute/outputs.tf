output "PublicIP" {
  description = "Public IP of EC2 instance"
  value       = "module.public_subnet.vpc_subnet_id"
}