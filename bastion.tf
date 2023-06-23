# Creacion de instancia
resource "aws_instance" "obli-InstanceBastion" {
  ami                    = var.tipoAMIBastion
  instance_type          = var.tipoInstBastion
  key_name               = var.nombKeyBastion
  subnet_id              = aws_subnet.obli-subnetBastion.id
  vpc_security_group_ids = [aws_security_group.obli-SGBastion.id]

  tags = {
    Name      = var.nombInstBastion
    terraform = true
  }
}

resource "null_resource" "imagenes"{
  
  connection {
    type        = "ssh"
    user        = "ec2-user"
    host        = aws_instance.obli-InstanceBastion.public_ip
    private_key = file("labsuser.pem")
  }

  # provisioner "file" {
  #   source = "build-docker-images.sh"
  #   destination = "/home/ec2-user/build-docker-images.sh"
  # }

  # provisioner "file" {
  #   source = "/home/admin/nuevo/ObligatorioCloud/src/adservice/"
  #   destination = "/home/ec2-user/src"
  # }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y git",
      "sudo yum install -y docker"
      # "sudo chmod +x /home/ec2-user/build-docker-images.sh",
      # "sudo sh /home/ec2-user/build-docker-images.sh"
    ]
  }

  depends_on = [aws_instance.obli-InstanceBastion]
}
