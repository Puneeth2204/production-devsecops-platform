output "aws_region" {
  description = "AWS region used by this environment"
  value       = var.aws_region
}

output "project_name" {
  description = "Project name used by this environment"
  value       = local.project_name
}

output "environment" {
  description = "Deployment environment"
  value       = local.environment
}

output "ecr_repository_name" {
  description = "Hospital Management ECR repository name"
  value       = module.ecr.repository_name
}

output "ecr_repository_url" {
  description = "Hospital Management ECR repository URL"
  value       = module.ecr.repository_url
}
