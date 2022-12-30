data "aws_subnets" "subnets-vpc-given" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

data "aws_subnet" "subnet-vpc-given" {
  for_each = toset(data.aws_subnets.subnets-vpc-given.ids)
  id       = each.value
}

