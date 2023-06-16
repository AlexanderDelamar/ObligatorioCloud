resource "aws_eks_cluster" "eks-cluster-example" {
  name     = "example"
  role_arn = "arn:aws:iam::735742781438:role/LabRole"

  vpc_config {
    subnet_ids = [aws_subnet.subnet-example.id, aws_subnet.subnet-example2.id]
  }

 }

output "endpoint" {
  value = aws_eks_cluster.eks-cluster-example.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.eks-cluster-example.certificate_authority[0].data
}

resource "aws_eks_node_group" "eks-node-example" {
  cluster_name    = aws_eks_cluster.eks-cluster-example.name
  node_group_name = "eks-node-example"
  node_role_arn   = "arn:aws:iam::735742781438:role/LabRole"
  subnet_ids      = [aws_subnet.subnet-example.id, aws_subnet.subnet-example2.id]
  ami_type        = "AL2_x86_64"
  capacity_type   = "ON_DEMAND"
  instance_types  = ["t3.medium"]
  remote_access  {
    ec2_ssh_key  = "vockey"
  }
  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

  update_config {
    max_unavailable = 1
  }



}
