variable "project_name" {
  description = "Name of the project used for resource naming"
  type        = string
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

variable "environment" {
  description = "Deployment environment"
  type        = string
}