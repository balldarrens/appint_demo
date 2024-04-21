variable "project_id" {
  type        = string
  description = "Project ID where secrets will be created"
}

variable "prefix" {
  type        = string
  description = "Random lowercase prefix"
}

variable "secrets" {
  type = map(object({  // Changed to map(object(...))
    secret_id        = string
    replication_type = string
  }))
  description = "Map of secrets to create (key: secret_id, value: object)"
}
