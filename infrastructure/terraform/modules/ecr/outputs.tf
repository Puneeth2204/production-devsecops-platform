
output "repository_name" {
  description = "ECR repository name"
  value       = aws_ecr_repository.hospital_management.name
}

output "repository_url" {
  description = "ECR repository URL used to push and pull images"
  value       = aws_ecr_repository.hospital_management.repository_url
}

output "repository_arn" {
  description = "ECR repository ARN"
  value       = aws_ecr_repository.hospital_management.arn
}
