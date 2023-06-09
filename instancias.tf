# Creacion de instancia
resource "aws_instance" "obli-instance" {
    ami = var.tipoAMI
    instance_type = var.tipoInstancia
    key_name = var.nomKey
    vpc_security_group_ids = [aws_security_group.obli-sg.id]

    tags = {
        Name = var.nomInstancia
        terraform = true
    }

    provisioner "remote-exec" {
        inline = [
            "sudo yum install -y httpd",
            "sudo systemctl enable httpd",
            "sudo systemctl start httpd"
        ]
    }

}