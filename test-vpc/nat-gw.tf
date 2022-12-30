# # NAT GW
# resource "aws_eip" "nat-gw-eip" {
#   vpc = true

#   tags = {
#     Name = "nat-gw-eip"
#   }

# }

# resource "aws_nat_gateway" "nat-gw" {
#   allocation_id = aws_eip.nat-gw-eip.id
#   subnet_id     = aws_subnet.public-1a.id

#   tags = {
#     Name = "nat-gw"
#   }

#   depends_on = [aws_internet_gateway.igw]
# }