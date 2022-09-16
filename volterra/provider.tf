terraform {
  required_providers {
    volterra = {
      source = "volterraedge/volterra"
      version = "0.11.12"
    }
  }
}

provider "volterra" {
  api_p12_file     = "/tmp/f5-amer-ent.console.ves.volterra.io.api-creds.p12"
  url              = "https://f5-amer-ent.console.ves.volterra.io/api"
}

provider "aws" {
  region  = var.awsRegion
  profile = "se"
}