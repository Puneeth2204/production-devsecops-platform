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

module "iam" {
  source = "../../modules/iam"

  project_name = local.project_name
  environment  = local.environment
}

module "ecr" {
  source = "../../modules/ecr"

  project_name = local.project_name
  environment  = local.environment
}

module "eks" {
  source = "../../modules/eks"

  project_name     = local.project_name
  environment      = local.environment
  cluster_role_arn = module.iam.eks_cluster_role_arn
  node_role_arn    = module.iam.eks_node_role_arn

  private_subnet_ids = module.vpc.private_subnet_ids

  kubernetes_version = "1.32"

  node_instance_types = ["c7i-flex.large"]
  node_desired_size   = 1
  node_min_size       = 1
  node_max_size       = 2

  cluster_endpoint_public_access_cidrs = ["49.207.234.228/32"]

  depends_on = [module.iam]
}

