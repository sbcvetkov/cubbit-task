module "codedeploy" {
  source  = "tmknom/terraform-aws-codedeploy-for-ecs"
  version = "1.2.0"

  name                       = "cubbit-app"
  ecs_cluster_name           = module.cubbit-ecs.aws_ecs_cluster_cluster_name
  ecs_service_name           = module.cubbit-ecs.aws_ecs_service_service_name
  lb_listener_arns           = module.cubbit-ecs.lb_http_listeners_arns
  blue_lb_target_group_name  = module.cubbit-ecs.lb_http_tgs_names
  green_lb_target_group_name = module.cubbit-ecs.lb_https_tgs_names
}

module "base-network" {
  source  = "cn-terraform/networking/aws"
  version = "2.0.12"

  name_prefix                                 = "cubbit-networking"
  vpc_cidr_block                              = "192.168.0.0/16"
  availability_zones                          = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"]
  public_subnets_cidrs_per_availability_zone  = ["192.168.0.0/19", "192.168.32.0/19", "192.168.64.0/19", "192.168.96.0/19"]
  private_subnets_cidrs_per_availability_zone = ["192.168.128.0/19", "192.168.160.0/19", "192.168.192.0/19", "192.168.224.0/19"]
}

module "cubbit-ecs" {
  source  = "cn-terraform/ecs-fargate/aws"
  version = "2.0.25"

  count = length(var.cubbit-apps)

  name_prefix         = var.cubbit-apps[count.index]
  vpc_id              = module.base-network.vpc_id
  container_image     = var.cubbit-apps[count.index]
  container_name      = var.cubbit-apps[count.index]
  public_subnets_ids  = module.base-network.public_subnets_ids
  private_subnets_ids = module.base-network.private_subnets_ids
}
