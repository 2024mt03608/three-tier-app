# Project ID where the resources will be deployed
variable "project_id" {
  type        = string
  description = "The project ID to deploy to."
}

# Compute region to use for resources (defaults to us-central1)
variable "region" {
  type        = string
  description = "The compute region to deploy to (e.g., us-central1)."
  default     = "us-central1"
}

# Compute zone to use for resources (defaults to us-central1-a)
variable "zone" {
  type        = string
  description = "The compute zone to deploy to (e.g., us-central1-a)."
  default     = "us-central1-a"
}

# Prefix to be used in naming resources (to distinguish deployments)
variable "deployment_name" {
  type        = string
  description = "Name prefix for resources in this deployment."
  default     = "three-tier-app"
}

# Choose between MySQL or PostgreSQL as the database type
variable "database_type" {
  type        = string
  description = "Cloud SQL database type to use: \"mysql\" or \"postgresql\"."
  default     = "postgresql"

  # Validates that the input is either "mysql" or "postgresql"
  validation {
    condition     = contains(["mysql", "postgresql"], var.database_type)
    error_message = "Must be either \"mysql\" or \"postgresql\"."
  }
}

# Labels to apply to all resources (used for organization or filtering)
variable "labels" {
  type        = map(string)
  description = "A map of labels to apply to all created resources."
  default     = { "three-tier-app" = "true" }
}

# Flag to auto-enable required Google Cloud APIs
variable "enable_apis" {
  type        = bool
  description = "Whether to automatically enable required Google Cloud APIs."
  default     = true
}

# List of IAM roles assigned to the Cloud Run service account
variable "run_roles_list" {
  description = "List of IAM roles to grant to the Cloud Run service account."
  type        = list(string)
  default = [
    "roles/cloudsql.instanceUser",
    "roles/cloudsql.client",
    "roles/secretmanager.secretAccessor",
    "roles/iam.serviceAccountUser"
  ]
}

# MySQL password, required only if MySQL is selected
variable "mysql_password" {
  type        = string
  description = "The password for the MySQL user (required if database_type = \"mysql\")."
  sensitive   = true
  default     = null
}
