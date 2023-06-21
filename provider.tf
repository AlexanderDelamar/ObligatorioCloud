terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = ">= 2.23.0"
    }
  }
}

provider "aws" {
  region  = var.regionProvider
  profile = var.perfil
}

provider "docker" {
  registry_auth {
      address = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.regionProvider}.amazon.com"
      username = data.aws_ecr_authorization_token.token.user_name
      password = data.aws_ecr_authorization_token.token.password
  }
}
