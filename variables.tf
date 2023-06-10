# Declacion variables para provider
variable "perfil" {
  type        = string
  description = "Declaracion perfil provider"
  default     = "default"
}
variable "region" {
  type        = string
  description = "Declaracion region provider"
  default     = "us-east-1"
}
# Declacion variables para instancia
variable "tipoAMI" {
  type        = string
  description = "Declaracion AMI"
  default     = "ami-04a0ae173da5807d3"
}
variable "tipoInstancia" {
  type        = string
  description = "Declaracion tipo instancia"
  default     = "t2.micro"
}
variable "nomKey" {
  type        = string
  description = "Declaracion key a usar"
  default     = "vockey"
}
variable "nomInstancia" {
  type        = string
  description = "Declaracion nombre instancia"
  default     = ""
}
# Declaracion variables network
variable "cidrVPC" {
  type        = string
  description = "Declaracion cidr para VPC"
  default     = ""
}
variable "nomVPC" {
  type        = string
  description = "Declaracion nombre VPC"
  default     = ""
}
variable "privateSubnet1" {
  type        = string
  description = "Declaracion subnet1"
  default     = "172.16.1.0/24"
}
variable "privateSubnet2" {
  type        = string
  description = "Declaracion subnet"
  default     = "172.16.2.0/24"
}
variable "AZ1" {
  type        = string
  description = "Declaracion AZ 1"
  default     = "us-east-1a"
}
variable "AZ2" {
  type        = string
  description = "Declaracion AZ 2"
  default     = "us-east-1b"
}
variable "nomSubnet1" {
  type        = string
  description = "Declaracion nombre subnet1"
  default     = "obli-private-subnet1"
}
variable "nomSubnet2" {
  type        = string
  description = "Declaracion nombre subnet2"
  default     = "obli-private-subnet2"
}
variable "nomGW" {
  type        = string
  description = "Declaracion nombre default gateway"
  default     = "obli-GW"
}
variable "nomRT" {
  type        = string
  description = "Declaracion nombre route table"
  default     = "obli-RT"
}
# Declaracion variables Security Group
variable "nomSG" {
  type        = string
  description = "Declaracion nombre SG"
  default     = "obli-SG"
}
# Declaracion variables target group
variable "nomTG" {
  type        = string
  description = "Declaracion nombre TG"
  default     = "obli-TG"
}
variable "targType" {
  type        = string
  description = "Declaracion target type"
  default     = "instance"
}
variable "protocolo" {
  type        = string
  description = "Declaracion protocolo"
  default     = "HTTP"
}
variable "nombLB" {
  type        = string
  description = "Declaracion nombre lb"
  default     = "obli-lb"
}
variable "tipoLB" {
  type        = string
  description = "Declaracion tipo lb"
  default     = "application"
}