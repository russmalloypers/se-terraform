terraform {
  required_providers {
    volterra = {
      source = "volterraedge/volterra"
      version = "0.11.12"
    }
  }
}

provider "volterra" {
  api_p12_file     = var.api_p12_file_location
  url              = "https://f5-amer-ent.console.ves.volterra.io/api"
}
