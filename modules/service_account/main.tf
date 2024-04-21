resource "google_service_account" "service_account" {
  for_each      = var.service_accounts
  account_id   = "${each.value.account_id}-${lower(var.prefix)}"
  display_name = each.value.display_name
  project      = var.project_id
  description  = each.value.description
}

resource "google_project_iam_member" "service_account_roles" {
  for_each = {
    for sa_key, sa_value in var.service_accounts :
    sa_key => [for role in sa_value.roles : {
      service_account_email = google_service_account.service_account[sa_key].email
      role                 = role
    }]
  }

  project  = var.project_id
  role     = each.value[1].role     # Access role property from the object
  member   = "serviceAccount:${each.value[0].service_account_email}"  # Extract service_account_email
}
