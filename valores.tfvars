# Variables de cluster
eksName       = "Obli-Cluster"
rolARN        = "arn:aws:iam::454758626479:role/LabRole"
nodegroupName = "Obli-Node"
nodeRolARN    = "arn:aws:iam::454758626479:role/LabRole"
tipoAMI       = "AL2_x86_64"
capacidadInst = "ON_DEMAND"
tipoInst      = "t3.medium"
capInst       = 2
tamMax        = 2
tamMin        = 2
maxIna        = 1
# Variables de VPC
bloqueVPC = "192.168.0.0/16"
bloqueSubnet1 = "192.168.1.0/24"
AZ1 = "us-east-1a"
nombreSubnet1 = "obli-subnet1"
bloqueSubnet2 = "192.168.2.0/24"
AZ2 = "us-east-1b"
nombreSubnet2 = "obli-subnet2"