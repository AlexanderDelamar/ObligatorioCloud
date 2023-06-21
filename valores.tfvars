# Variables de cluster
eksName       = "Obli-Cluster"
nodegroupName = "Obli-Node"
tipoAMI       = "AL2_x86_64"
capacidadInst = "ON_DEMAND"
tipoInst      = "t3.medium"
capInst       = 2
tamMax        = 2
tamMin        = 2
maxIna        = 1
# Variables de VPC
bloqueVPC     = "192.168.0.0/16"
bloqueSubnet1 = "192.168.1.0/24"
AZ1           = "us-east-1a"
nombreSubnet1 = "Obli-Subnet1"
bloqueSubnet2 = "192.168.2.0/24"
AZ2           = "us-east-1b"
nombreSubnet2 = "Obli-Subnet2"
# Variables de Bastion
tipoAMIBastion  = "ami-04a0ae173da5807d3"
tipoInstBastion = "t2.micro"
nombKeyBastion  = "vockey"
nombInstBastion = "Obli-Bastion"
# Variables de VPC Bastion
bloqueVPCBastion  = "172.16.0.0/16"
subnetBastion     = "172.16.1.0/24"
AZBastion = "us-east-1a"
nombSubnetBastion = "Obli-BastionSubnet"

nombGWBastion         = "Gateway Bastion"

nombRTBastion = "Tabla rutas Bastion"

nombSGBastion = "Security Group Bastion"

regionProvider = "us-east-1"
perfil = "default"