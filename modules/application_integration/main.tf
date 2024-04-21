
/*
resource "google_service_account" "application_integration_service_account" {
  account_id   = var.service_account_id
  display_name = var.service_account_display_name
  description = var.service_account_description
  project = var.project_id
}
*/

resource "google_integrations_client" "default" {
  location = var.location
  provision_gmek = var.provision_gmek
  create_sample_workflows = var.create_sample_workflows
#  run_as_service_account = google_service_account.application_integration_service_account.email
  project = var.project_id
}

