# --- root/variables.tf ---
variable "main_region" {
  type    = string
  default = "us-east-1"
}

variable "main_vpc_cidr" {}
variable "public_subnets" {}
variable "private_subnets" {}