resource "google_secret_manager_secret" "secret" {
  for_each   = var.secrets
  secret_id = "${each.value.secret_id}-${var.prefix}"  # Construct secret_id with prefix
  replication {
    auto { }  # Empty block for automatic replication (Google provider 5.25)
  }
  project = var.project_id
}
