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