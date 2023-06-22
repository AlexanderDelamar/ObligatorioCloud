provider "aws" {
  region  = var.regionProvider
  profile = var.perfil
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}
