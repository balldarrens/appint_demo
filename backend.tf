terraform {
  backend "gcs" {
    bucket = "darrenball_altostrat_terraform_states"
    prefix = "demo-appint3/terraform-state"
  }
}