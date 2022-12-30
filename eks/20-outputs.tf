output "subnet_cidr_blocks" {
  value = [for s in data.aws_subnet.subnet-vpc-given : s.cidr_block]
}

output "test_role_arn" {
  value = aws_iam_role.test_oidc.arn
}