resource "aws_eks_cluster" "eks-cluster-example" {
  name     = var.eksName
  role_arn = var.rolARN

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
  node_group_name = var.nodegroupName
  node_role_arn   = var.nodeRolARN
  subnet_ids      = [aws_subnet.subnet-example.id, aws_subnet.subnet-example2.id]
  ami_type        = var.tipoAMI
  capacity_type   = var.capacidadInst
  instance_types  = [var.tipoInst]

  remote_access {
    ec2_ssh_key = "vockey"
  }

  scaling_config {
    desired_size = var.capInst
    max_size     = var.tamMax
    min_size     = var.tamMin
  }

  update_config {
    max_unavailable = var.maxIna
  }
}

# data "aws_eks_cluster" "eks-cluster-example" {
#   name = "example"
# }
# data "aws_eks_cluster_auth" "eks-cluster-example" {
#   name = "example"
# }

# provider "kubernetes" {
#   host = data.aws_eks_cluster.eks-cluster-example.endpoint
#   cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks-cluster-example.certificate_authority[0].data)
#   exec {
#     api_version = "client.authentication.k8s.io/v1beta1"
#     args        = ["eks", "get-token", "--cluster-name", "example"]
#     command     = "aws"
#   }
# }
