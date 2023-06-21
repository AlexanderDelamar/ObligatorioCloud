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

  connection {
    type        = "ssh"
    user        = "ec2-user"
    host        = self.public_ip
    private_key = file("labsuser.pem")
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y git",
      "sudo yum install -y docker"
      
    ]
  }
}
