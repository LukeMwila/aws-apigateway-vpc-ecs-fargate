# VPC for ECS Fargate
module "vpc_for_ecs_fargate" {
  source = "./vpc"
  vpc_tag_name = "${var.platform_name}-vpc"
  number_of_private_subnets = 2
  private_subnet_tag_name = "${var.platform_name}-private-subnet"
  route_table_tag_name = "${var.platform_name}-rt"
  environment = var.environment
  security_group_lb_name = "${var.platform_name}-alb-sg"
  security_group_ecs_tasks_name = "${var.platform_name}-ecs-tasks-sg"
  app_port = var.app_port
  main_pvt_route_table_id = var.main_pvt_route_table_id
  availability_zones = var.availability_zones
  region = var.region
}

# ECS cluster
module ecs_cluster {
  source = "./ecs-cluster"
  name = "${var.platform_name}-${var.environment}-cluster"
  cluster_tag_name = "${var.platform_name}-${var.environment}-cluster"
}

# ECS task definition and service
module ecs_task_definition_and_service {
  # Task definition and NLB
  source = "./ecs-fargate"
  name = "${var.platform_name}-${var.environment}"
  app_image = var.app_image
  fargate_cpu                 = 1024
  fargate_memory              = 2048
  app_port = var.app_port
  vpc_id = module.vpc_for_ecs_fargate.vpc_id
  environment = var.environment
  # Service
  cluster_id = module.ecs_cluster.id 
  app_count = var.app_count
  aws_security_group_ecs_tasks_id = module.vpc_for_ecs_fargate.ecs_tasks_security_group_id
  private_subnet_ids = module.vpc_for_ecs_fargate.private_subnet_ids
}

# API Gateway and VPC link
module api_gateway {
  source = "./api-gateway"
  name = "${var.platform_name}-${var.environment}"
  integration_input_type = "HTTP_PROXY"
  path_part = "{proxy+}"
  app_port = var.app_port
  nlb_dns_name = module.ecs_task_definition_and_service.nlb_dns_name
  nlb_arn = module.ecs_task_definition_and_service.nlb_arn
  environment = var.environment
}