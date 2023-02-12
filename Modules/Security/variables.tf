variable "vpc_id" {
  description = "VPC ID to create security group"
  type        = string
  default     = null
}

variable "name" {
  description = "Name of security group"
  type        = string
  default     = null
}

variable "ingress_rules" {
  description = "List of ingress rules to create"
  type        = list(string)
  default     = []
}

variable "ingress_with_cidr_blocks" {
  description = "Create where 'cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

variable "ingress_cidr_blocks" {
  description = "IPv4 CIDR ranges"
  type        = list(string)
  default     = []
}

variable "egress_rules" {
  description = "Egress rules to create"
  type        = list(string)
  default     = []
}