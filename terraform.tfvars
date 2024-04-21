# Backend configuration
backend_prefix      = "appint-demo/terraform/state"

# Project variables
apis = [
  "aiplatform.googleapis.com",
  "analyticshub.googleapis.com",
  "bigquery.googleapis.com",
  "bigquerydatapolicy.googleapis.com",
  "bigquerymigration.googleapis.com",
  "bigqueryreservation.googleapis.com",
  "bigquerystorage.googleapis.com",
  "connectors.googleapis.com",
  "dataform.googleapis.com",
  "dataplex.googleapis.com",
  "integrations.googleapis.com",
  "pubsub.googleapis.com",
  "secretmanager.googleapis.com",
  "serviceusage.googleapis.com"
]


# Location for GCS bucket (optional, if not specified in main.tf)
location = "us-central1" # Replace with your desired location

# Secrets (simple list of objects)
secrets = [
  {
    secret_id        = "sfdc-user-password"
    replication_type = "automatic"
  },
  {
    secret_id        = "sfdc-user-token"
    replication_type = "automatic"
  }
]

# Service Accounts (simple list of objects)
# Service Accounts
service_accounts = {
  "sfdc-connector-sa": {
    account_id:   "sfdc-connector-sa",  # Add account_id here
    display_name = "SFDC Connector Service Account"
    description  = "SFDC Connector Service Account"
    roles        = [
      "roles/secretmanager.secretAccessor",
      "roles/secretmanager.viewer"
    ]
  },
  "pubsub-sa": {
    account_id:   "pubsub-sa",  # Add account_id here
    display_name = "PubSub Service Account"
    description  = "PubSub Service Account"
    roles        = [
      "roles/integrations.integrationInvoker",
      "roles/pubsub.editor",
      "roles/iam.serviceAccountUser"
    ]
  }
}
