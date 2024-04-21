terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.25"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

resource "random_string" "lowercase_prefix" {
  length = 4  # Adjust length as needed
  lower  = true
  special = false
}

module "project" {
  source = "./modules/project"

  num_projects    = 2
  project_prefix = "appint-demo-proj-${lower(random_string.lowercase_prefix.result)}"
  owner_email    = var.owner_email
  apis           = var.apis
  //org_id         = var.org_id
  folder_id = var.folder_id
  billing_account = var.billing_account
}


locals {
  secrets_map = { for s in var.secrets : s.secret_id => s }  # Remains the same
  service_accounts_map = var.service_accounts  # Use the map directly
}


module "secret" {
  source    = "./modules/secret"
  project_id = module.project.project_id[1]  # Second project's ID
  prefix     = random_string.lowercase_prefix.result
  secrets = local.secrets_map
}

module "service_account" {
  source          = "./modules/service_account"
  project_id     = module.project.project_id[1]  # Second project's ID
  prefix         = random_string.lowercase_prefix.result
  service_accounts = local.service_accounts_map
}

resource "google_storage_bucket" "media_files" {
  project = module.project.project_id[1]  # Second project's ID
  name    = "${module.project.project_id[1]}-media-files"
  location = var.location
  uniform_bucket_level_access = true
}

module "application_integration" {
  source = "./modules/application_integration"
#  service_account_id = "integrations-sa-${lower(random_string.lowercase_prefix.result)}"
#  service_account_display_name = "Applications Integrations Service Account"
#  service_account_description = "Applications Integrations Service Account"
  location = var.location
  project_id = module.project.project_id[1]  # Second project's ID
}
