variable "eksName" {
  type        = string
  description = "Declaracion nombre del cluster"
  default     = "Obli-Cluster"
}
variable "nodegroupName" {
  type        = string
  description = "Declaracion nombre de node group"
  default     = "Obli-Node"
}
variable "tipoAMI" {
  type        = string
  description = "Declaracion de AMI"
  default     = "AL2_x86_64"
}
variable "capacidadInst" {
  type        = string
  description = "Declarion de capacidad de instancia"
  default     = "ON_DEMAND"
}
variable "tipoInst" {
  type        = string
  description = "Declaracion de tipo de instancia"
  default     = "t3.medium"
}
variable "capInst" {
  type        = number
  description = "Capacidad de instancias"
  default     = 2
}
variable "tamMax" {
  type        = number
  description = "Maximo instancias"
  default     = 2
}
variable "tamMin" {
  type        = number
  description = "Minimo instancias"
  default     = 2
}
variable "maxIna" {
  type        = number
  description = "Maximo instancias inhabilitadas"
  default     = 1
}
variable "bloqueVPC" {
  type        = string
  description = "Declaracion VPC"
  default     = "192.168.0.0/16"
}
variable "bloqueSubnet1" {
  type        = string
  description = "Declaracion subnet para inst1"
  default     = "192.168.1.0/24"
}
variable "AZ1" {
  type        = string
  description = "Declaracion Availability Zone"
  default     = "us-east-1a"
}
variable "nombreSubnet1" {
  type        = string
  description = "Declaracion nombre Subnet1"
  default     = "obli-subnet1"
}
variable "bloqueSubnet2" {
  type        = string
  description = "Declaracion subnet para inst2"
  default     = "192.168.2.0/24"
}
variable "AZ2" {
  type        = string
  description = "Declaracion Availability Zone"
  default     = "us-east-1b"
}
variable "nombreSubnet2" {
  type        = string
  description = "Declaracion nombre Subnet2"
  default     = "obli-subnet2"
}