variable "aws_region" {
  description = "AWS region for the deployment"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR range for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDR ranges for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR ranges for private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability Zones for the subnets"
  type        = list(string)
}
