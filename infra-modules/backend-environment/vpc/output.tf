output vpc_arn {
  value = aws_vpc.custom_vpc.arn
}

output vpc_id {
  value = aws_vpc.custom_vpc.id
}

output private_subnet_ids {
  value = aws_subnet.private_subnet.*.id
}

output ecs_tasks_security_group_id {
  value = aws_security_group.ecs_tasks.id
}