# Variables para bastion
variable "tipoAMIBastion" {
  type        = string
  description = "Declaracion AMI"
  default     = "ami-04a0ae173da5807d3"
}
variable "tipoInstBastion" {
  type        = string
  description = "Declaracion tipo instancia"
  default     = "t2.micro"
}
variable "nombKeyBastion" {
  type        = string
  description = "Declaracion key a usar"
  default     = "vockey"
}
variable "nombInstBastion" {
  type        = string
  description = "Declaracion nombre instancia"
  default     = "Obli-Bastion"
}
variable "bloqueVPCBastion" {
  type        = string
  description = ""
  default     = "172.16.0.0/16"
}
variable "subnetBastion" {
  type        = string
  description = ""
  default     = "172.16.0.0/24"
}
variable "AZBastion" {
  type        = string
  description = ""
  default     = "us-east-1a"
}
variable "nombSubnetBastion" {
  type        = string
  description = ""
  default     = "Obli-BastionSubnet"
}
variable "nombGWBastion" {
  type        = string
  description = ""
  default     = "Gateway Bastion"
}
variable "nombRTBastion" {
  type        = string
  description = ""
  default     = "Tabla rutas Bastion"
}
variable "nombSGBastion" {
  type        = string
  description = ""
  default     = "Security Group Bastion"
}
