# Creacion de instancia
resource "aws_instance" "obli-instance" {
    ami = var.tipoAMI
    instance_type = var.tipoInstancia
    key_name = var.nomKey
    vpc_security_group_ids = []
    associate_public_ip_address = true
    
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