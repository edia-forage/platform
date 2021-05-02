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
    