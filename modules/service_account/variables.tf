variable "project_id" {
  type        = string
  description = "Project ID where service accounts will be created"
}

variable "prefix" {
  type        = string
  description = "Random lowercase prefix"
}

variable "service_accounts" {
  type = map(object({
    account_id   = string
    display_name = string
    description  = string
    roles        = list(string)
  }))
  description = "Map of service accounts to create (without prefix)"
}