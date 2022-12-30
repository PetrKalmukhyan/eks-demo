# Cluster

resource "aws_iam_role" "demo" {
  name = "eks-cluster-demo"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}


resource "aws_iam_role_policy_attachment" "demo-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.demo.name
}

resource "aws_eks_cluster" "demo" {
  name     = var.eks_cluster_name
  role_arn = aws_iam_role.demo.arn
  version = var.eks_version

   vpc_config {
    subnet_ids = [ for s in data.aws_subnet.subnet-vpc-given : s.id ]
  }


  depends_on = [aws_iam_role_policy_attachment.demo-AmazonEKSClusterPolicy]
}