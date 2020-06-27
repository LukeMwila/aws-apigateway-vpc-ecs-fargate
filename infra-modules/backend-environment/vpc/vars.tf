variable "vpc_tag_name" {
  type        = string
  description = "Name tag for the VPC"
}

variable "number_of_private_subnets" {
  type = number 
  default = 1
  description = "The number of private subnets in a VPC."
}

variable "private_subnet_tag_name" {
  type        = string
  description = "Name tag for the private subnet"
}

variable "route_table_tag_name" {
  type        = string
  default     = "main"
  description = "Route table description"
}

variable "main_pvt_route_table_id" {
  type        = string
  description = "Main route table id"
}

variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block range for vpc"
}

variable "private_subnet_cidr_blocks" {
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.4.0/24"]
  description = "CIDR block range for the private subnets"
}

variable "environment" {
  type        = string
  description = "Application enviroment"
}

variable "security_group_lb_name" {
  type        = string
  default     = "alb-sg"
  description = "Load Balancer security group name"
}

variable "security_group_lb_description" {
  type        = string
  default     = "controls access to the ALB"
  description = "Load Balancer security group description"
}

variable "security_group_ecs_tasks_name" {
  type        = string
  default     = "ecs-tasks-sg"
  description = "ECS Tasks security group name"
}

variable "security_group_ecs_tasks_description" {
  type        = string
  default     = "allow inbound access from the ECS ALB only"
  description = "ECS tasks security group description"
}

variable "app_port" {
  type        = string
  description = "app port"
}

variable "region" {
  type = string 
  description = "The AWS region where resources have been deployed"
}

variable "availability_zones" {
  type  = list(string)
  description = "List of availability zones for the selected region"
}