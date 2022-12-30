#IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.eks-vpc.id

  tags = {
    Name = "igw"
  }
}