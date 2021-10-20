terraform {
  backend "s3" {
    bucket  = "terraformstate.rearc-test-bucket"
    key     = "rearc.tfstate"
    region  = "us-east-2"
    encrypt = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}
