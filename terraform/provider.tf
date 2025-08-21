terraform {
  required_version = ">= 1.14.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.9.0"
    }
  }

  backend "s3" {
    key          = "tfstate/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile   = true
  }
}

provider "aws" {
  region = "us-east-1"
  # Se quiser usar perfil local, descomente:
  # shared_config_files      = [".aws/config"]
  # shared_credentials_files = [".aws/credentials"]
  # profile                  = "iac"
}
