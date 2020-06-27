resource "aws_ecs_cluster" "main" {
  name = var.name

  tags = {
    Name = var.cluster_tag_name
  }
}