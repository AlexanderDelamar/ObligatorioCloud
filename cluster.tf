data "aws_iam_role" "labrole_arn" {
  name = "LabRole"
}

# Creacion de Cluster EKS
resource "aws_eks_cluster" "obli-EKS" {
  name     = var.eksName
  role_arn = data.aws_iam_role.labrole_arn.arn

  vpc_config {
    subnet_ids = [aws_subnet.obli-ClusterSubnet1.id, aws_subnet.obli-ClusterSubnet2.id]
    security_group_ids = [aws_security_group.obli-eks-sg.id]
  }

}

output "endpoint" {
  value = aws_eks_cluster.obli-EKS.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.obli-EKS.certificate_authority[0].data
}

# Creacion de los nodos
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

# Auto scaling de los nodos, cambiar en variables para aumentar o disminuir instancias en ejecucion
  scaling_config {
    desired_size = var.capInst
    max_size     = var.tamMax
    min_size     = var.tamMin
  }

  update_config {
    max_unavailable = var.maxIna
  }
}