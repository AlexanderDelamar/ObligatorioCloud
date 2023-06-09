# Declacion variables para provider
variable "perfil" {
    type = string
    description = "Declaracion perfil provider"
    default = "default"
}

variable "region" {
    type = string
    description = "Declaracion region provider"
    default = "us-east-1"
}

# Declacion variables para instancia
variable "tipoAMI" {
    type = string
    description = "Declaracion AMI"
    default = "ami-04a0ae173da5807d3"
}

variable "tipoInstancia" {
    type = string
    description = "Declaracion tipo instancia"
    default = "t2.micro"
}

variable "nomKey" {
    type = string
    description = "Declaracion key a usar"
    default = "vockey"
}

variable "nomInstancia" {
    type = string
    description = "Declaracion nombre instancia"
    default = ""
}
