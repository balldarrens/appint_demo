variable "num_projects" {
  type        = number
  description = "Number of projects to create"
}

variable "project_prefix" {
  type        = string
  description = "Prefix for project names"
}

variable "owner_email" {
  type        = string
  description = "Email address of the project owner"
}

variable "apis" {
  type        = list(string)
  description = "List of APIs to enable"
}

//variable "org_id" {  // Add this
//  type        = string
//  description = "Organization ID"
//}

variable "folder_id" {  // Add this
  type        = string
  description = "Folder ID"
}


variable "billing_account" {  // Add this
  type        = string
  description = "Billing account ID"
}
