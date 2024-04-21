resource "google_project" "project" {
  count         = var.num_projects
  project_id    = "${var.project_prefix}-${count.index + 1}"
  name          = "${var.project_prefix}-${count.index + 1}"
  folder_id     = var.folder_id  // Use folder_id if applicable
  billing_account = var.billing_account
}

resource "google_project_iam_member" "owner" {
  for_each = { for i in range(var.num_projects) : i => i }
  project  = google_project.project[each.value].project_id
  role     = "roles/owner"
  member   = "user:${var.owner_email}"
}

#resource "google_project_iam_member" "owner" {
# for_each = { for p in google_project.project : p.project_id => p }
#  project  = each.value.project_id
#  role     = "roles/owner"
#  member   = "user:${var.owner_email}"
#}

resource "google_project_service" "services" {
  for_each = toset(var.apis)
  project  = google_project.project[0].project_id  # Enable APIs only for the first project
  service  = each.value
  disable_dependent_services = true
}

resource "google_project_service" "services1" {
  for_each = toset(var.apis)
  project  = google_project.project[1].project_id  # Enable APIs only for the first project
  service  = each.value
  disable_dependent_services = true
}


output "project_id" {
  value = google_project.project[*].project_id  # Output all project IDs
  # OR
  # value = google_project.project[0].project_id  # Output only the first project ID
}
