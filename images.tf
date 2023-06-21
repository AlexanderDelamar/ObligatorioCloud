resource "aws_ecr_repository" "obli-images" {
  name                 = "obligatorio"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "docker_registry_image" "image" {
  name = "${aws_ecr_repository.obli-images.repository_url}:adservice"
  keep_remotely = true
}

resource "docker_image" "image" {
  name = "${aws_ecr_repository.obli-images.repository_url}"
  build {
    context = "${path.cwd}/home/admin/nuevo/ObligatorioCloud/src/adservice"
  }
}