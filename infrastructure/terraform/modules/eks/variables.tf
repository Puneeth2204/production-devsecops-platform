
variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.32"
}

variable "cluster_role_arn" {
  description = "IAM role ARN for the EKS cluster"
  type        = string
}

variable "node_role_arn" {
  description = "IAM role ARN for EKS worker nodes"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for the cluster and worker nodes"
  type        = list(string)
}

variable "node_instance_types" {
  description = "EC2 instance types for worker nodes"
  type        = list(string)
  default     = ["c7i-flex.large"]
}

variable "node_desired_size" {
  description = "Desired worker node count"
  type        = number
  default     = 1
}

variable "node_min_size" {
  description = "Minimum worker node count"
  type        = number
  default     = 1
}

variable "node_max_size" {
  description = "Maximum worker node count"
  type        = number
  default     = 2
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "CIDRs allowed to access the public EKS API endpoint"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
