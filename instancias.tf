# Creacion de instancia
resource "aws_instance" "obli-instance" {
  ami                    = var.tipoAMI
  instance_type          = var.tipoInstancia
  key_name               = var.nomKey
  subnet_id              = aws_subnet.obli-private-subnet1.id
  vpc_security_group_ids = [aws_security_group.obli-sg.id]

  tags = {
    Name      = var.nomInstancia
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
      "sudo yum install -y httpd",
      "sudo systemctl enable httpd",
      "sudo systemctl start httpd"
    ]
  }
}

resource "aws_ami_from_instance" "obli-instance-ami" {
  name               = "obli-ami"
  source_instance_id = aws_instance.obli-instance.id
}

resource "aws_launch_template" "obli-template" {
  name                 = "obli-template"
  image_id             = aws_ami_from_instance.obli-instance-ami.id
  instance_type        = var.tipoInstancia # Reemplaza con el tipo de instancia deseado
  key_name             = var.nomKey

  # vpc_security_group_ids = [aws_security_group.obli-sg.id] # Si esto se elimina funciona AutoScaling usando Default SG - Si se queda no funciona
  
  network_interfaces {
    device_index         = 0
    subnet_id            = aws_subnet.obli-private-subnet1.id
    associate_public_ip_address = true
  }

}

resource "aws_autoscaling_group" "obli-asg" {
  name             = "obli-ASG"
  max_size         = 4 # Reemplaza con el tamaño máximo deseado
  min_size         = 2 # Reemplaza con el tamaño mínimo deseado
  desired_capacity = 2 # Reemplaza con la capacidad deseada
  launch_template {
    id      = aws_launch_template.obli-template.id
    version = "$Latest"
  }
  health_check_type   = "EC2"                                                                    # Opciones: EC2 o ELB (según tu configuración)
  vpc_zone_identifier = [aws_subnet.obli-private-subnet1.id, aws_subnet.obli-private-subnet2.id] # Reemplaza con las subredes deseadas

}
