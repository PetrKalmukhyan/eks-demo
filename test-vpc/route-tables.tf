# #Routing tables and associations
# resource "aws_route_table" "rt-private" {
#   vpc_id = aws_vpc.eks-vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_nat_gateway.nat-gw.id
#   }


#   tags = {
#     Name = "rt-private"
#   }
# }

resource "aws_route_table" "rt-public" {
  vpc_id = aws_vpc.eks-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "rt-public"
  }
}

# resource "aws_route_table_association" "private-1a" {
#   subnet_id      = aws_subnet.private-1a.id
#   route_table_id = aws_route_table.rt-private.id
# }

# resource "aws_route_table_association" "private-1b" {
#   subnet_id      = aws_subnet.private-1b.id
#   route_table_id = aws_route_table.rt-private.id
# }

resource "aws_route_table_association" "public-1a" {
  subnet_id      = aws_subnet.public-1a.id
  route_table_id = aws_route_table.rt-public.id
}

resource "aws_route_table_association" "public-1b" {
  subnet_id      = aws_subnet.public-1b.id
  route_table_id = aws_route_table.rt-public.id
}
