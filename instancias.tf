# Creacion de instancia
resource "aws_instance" "obli-instance" {
    ami = var.tipoAMI
    instance_type = var.tipoInstancia
    key_name = var.nomKey
    subnet_id = aws_subnet.obli-private-subnet1.id
    vpc_security_group_ids = [aws_security_group.obli-sg.id]

    tags = {
        Name = var.nomInstancia
        terraform = true
    }

    connection {
        type     = "ssh"
        user     = "ec2-user"
        host     = self.public_ip
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

resource "aws_ami_from_instance" "obli-imgAutoScaling" {
  name               = "img-autoscaling"
  source_instance_id = aws_instance.obli-instance.id
}
