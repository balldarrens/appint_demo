variable "location" {
  description = "Location for resources"
  type = string
  default = "us-east1"
}

variable "project_id" {
  type        = string
  description = "Project ID where service accounts will be created"
}
/*
variable "service_account_id" {
  description = "ID of the service account"
  type = string
}

variable "service_account_display_name" {
  description = "Display name of the service account"
  type = string
}

variable "service_account_description" {
  description = "Descriptions of the service account"
  type = string
}
*/

variable "create_sample_workflows" {
  description = "Whether to create sample workflows for the Integrations Client"
  type = bool
  default = false
}

variable "provision_gmek" {
  description = "Simple setup, use gmek"
  type = bool
  default = true
}
