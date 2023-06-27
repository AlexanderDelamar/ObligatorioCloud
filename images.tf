# Creacion de repositorio ECR
resource "aws_ecr_repository" "obli-images" {
  name                 = "obligatorio"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  depends_on = [aws_eks_node_group.obli-EKSNode]
}

# Ejecucion local del script
resource "null_resource" "pushimagenes" {
  provisioner "local-exec" {
    command = "sh build-docker-images.sh"
  }
  depends_on = [aws_ecr_repository.obli-images]
}