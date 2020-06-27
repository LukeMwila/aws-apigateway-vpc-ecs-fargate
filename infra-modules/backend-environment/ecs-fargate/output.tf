output nlb_arn {
  value       = aws_lb.nlb.arn
  description = "ARN for the internal NLB"
}

output nlb_dns_name {
  value       = aws_lb.nlb.dns_name
  description = "DNS name for the internal NLB"
}