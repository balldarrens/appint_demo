variable "owner_email" {
  type        = string
  description = "Email address of the project owner"
}

variable "apis" {
  type        = list(string)
  description = "List of APIs to enable"
}

variable "folder_id" {  // Assuming you're using folders
  type        = string
  description = "Folder ID where projects will be created"
}

variable "billing_account" {
  type        = string
  description = "Billing account ID"
}

variable "location" {
  type        = string
  description = "Location for the GCS bucket"
}

variable "backend_bucket_name" {
  type        = string
  description = "Name of the GCS bucket for Terraform state"
}

variable "backend_prefix" {
  type        = string
  description = "Prefix within the GCS bucket for Terraform state"
}

variable "secrets" {
  type = list(object({
    secret_id        = string
    replication_type = string
  }))
  description = "List of secrets to create (without prefix)"
}

variable "service_accounts" {
  type = map(object({  # Changed to map(object(...))
    account_id   = string
    display_name = string
    description  = string
    roles        = list(string)
  }))
  description = "Map of service accounts to create (without prefix)"
}