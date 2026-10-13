locals {
  project_name = "hospital-devsecops"
  environment  = "dev"
}

module "vpc" {
  source = "../../modules/vpc"

  project_name         = local.project_name
  environment          = local.environment
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}
