data "aws_iam_role" "labrole_arn" {
  name = "LabRole"
}

resource "aws_eks_cluster" "obli-EKS" {
  name     = var.eksName
  role_arn = data.aws_iam_role.labrole_arn.arn

  vpc_config {
    subnet_ids = [aws_subnet.obli-ClusterSubnet1.id, aws_subnet.obli-ClusterSubnet2.id]
  }

}

output "endpoint" {
  value = aws_eks_cluster.obli-EKS.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.obli-EKS.certificate_authority[0].data
}

resource "aws_eks_node_group" "obli-EKSNode" {
  cluster_name    = aws_eks_cluster.obli-EKS.name
  node_group_name = var.nodegroupName
  node_role_arn   = data.aws_iam_role.labrole_arn.arn
  subnet_ids      = [aws_subnet.obli-ClusterSubnet1.id, aws_subnet.obli-ClusterSubnet2.id]
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

resource "kubernetes_manifest" "example" {
  manifest = file("/home/admin/nuevo/ObligatorioCloud/src/productcatalogservice/deployment/kubernetes-manifests.yaml")
}
