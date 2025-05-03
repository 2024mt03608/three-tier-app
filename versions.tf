# Terraform configuration block defining required versions and providers
terraform {
  # Minimum required Terraform version
  required_version = ">= 1.5.0"

  # Required providers and their allowed versions
  required_providers {
    # Google Cloud provider (stable version)
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0, <= 4.74.0, != 4.75.0"  # Version 4.75.0 is explicitly excluded due to issues
    }

    # Google Cloud provider (beta features)
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 4.0.0, <= 4.74.0, != 4.75.0"
    }

    # Random provider for generating random IDs
    random = {
      source  = "hashicorp/random"
      version = ">= 2.2.0"
    }

    # Time provider used for adding sleep or wait operations
    time = {
      source  = "hashicorp/time"
      version = "~> 0.12.0"
    }
  }

  # Metadata to identify the module when reporting to GCP
  provider_meta "google" {
    module_name = "blueprints/terraform/terraform-google-three-tier-web-app/v0.1.9"
  }
}
