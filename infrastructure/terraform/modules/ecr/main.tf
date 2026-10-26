
resource "aws_ecr_repository" "hospital_management" {
  name                 = "${var.project_name}-${var.environment}-hospital-management"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-hospital-management"
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_ecr_lifecycle_policy" "hospital_management" {
  repository = aws_ecr_repository.hospital_management.name

  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "Retain the 10 most recent images"
      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = 10
      }
      action = {
        type = "expire"
      }
    }]
  })
}
