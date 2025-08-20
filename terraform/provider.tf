terraform {
  required_version = ">= 1.12.1, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.9.0"
    }
  }

  backend "s3" {
    bucket       = var.UnicBucketName
    key          = "tfstate/terraform.tfstate"
    region       = "us-east-1"
    dynamodb_table = "terraform-locks" # opcional, mas recomendado para evitar concorrência
  }
}

provider "aws" {
  region = "us-east-1"
  # Se quiser usar perfil local, descomente:
  # shared_config_files      = [".aws/config"]
  # shared_credentials_files = [".aws/credentials"]
  # profile                  = "iac"
}
