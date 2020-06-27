variable "module" {
  description = "The terraform module used to deploy"
  type        = string
}

variable "profile" {
  description = "AWS profile"
  type        = string
}

variable "region" {
  description = "aws region to deploy to"
  type        = string
}

variable "platform_name" {
  description = "The name of the platform"
  type = string
}

variable "environment" {
  description = "Applicaiton environment"
  type = string
}

variable "app_port" {
  description = "Application port"
  type = number
}

variable "app_image" {
  type = string 
  description = "Container image to be used for application in task definition file"
}

variable "availability_zones" {
  type  = list(string)
  description = "List of availability zones for the selected region"
}

variable "app_count" {
  type = string 
  description = "The number of instances of the task definition to place and keep running."
}

variable "main_pvt_route_table_id" {
  type        = string
  description = "Main route table id"
}