terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.24.0"
    }
  }

  backend "gcs" {
    bucket = "challenge-esgi-bucket-tfstate"
    prefix = "terraform/state"
  }
}
