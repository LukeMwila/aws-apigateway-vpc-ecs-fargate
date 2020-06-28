# Deploy Container in ECS Fargate behind API Gateway & NLB for Secure Optimal Accessibility (with Terraform)
## Overview
This repository contains the source code for a containerised application in AWS ECS Fargate inside a VPC's private subnets. An API Gateway is used as the doorway to the private network using a VPC link to access the VPC. An NLB is for optimal performance of accessing the application running in the private subnets.


## Technical Architecture Diagram
![Alt text](./api-gateway-vpclink-ecs-fargate.png?raw=true "Technical Architecture Diagram")