terraform {
    required_version = ">= 0.11.8"

    required_providers {
        google = {
        source = "hashicorp/google"
        version = "3.5.0"
        }
    }

    backend "gcs" {
        credentials = "sa-terraform.json"
        bucket  = "neon-polymer-366-tfstate"
        prefix  = "terraform/state"
    }
}

provider "google" {

  #credentials = file("sa-terraform.json")
  credentials = file(var.credentials_file)

  #project = "neon-polymer-366"
  project = var.project_id

  region  = "us-central1"
  #region = var.region

  zone    = "us-central1-c"
  #zone = var.zone

  //version = ">= 2.0.0"
}
    