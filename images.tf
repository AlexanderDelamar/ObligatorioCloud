resource "aws_ecr_repository" "obli-images" {
  name                 = "obligatorio"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}