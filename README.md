In order to apply the terrform, it is required to pass the following vars in during apply:

* folder_id (folder id where new projects will be created)
* billing_account (billing account id to associate with the projects)
* owner_email (user id/email that will be the project owner of each project)
* backend_bucket_name (where to keep terraform state)


The backend prefix used in conjunction with the backend bucket is hardcoded to: appint-demo/terraform/state
You can change this by setting a variable for that as well.  The variable is:  backend_prefix

For consistency, gitignore ignores a file called tfapply.sh.

You can set all this in a shell to execute:

```bash
#!/bin/bash
# set env variables for:
tf_folder_id="123456789012" #12 digit forlder id
tf_billing_account="000000-000000-000000" # HEX BILLING ID
tf_owner_email="user@example.com" #email address/user from org
tf_backend_bucket_name="unique_bucket_name_here"

# apply this to the command line similar to the other variables if you want to change the default backend prefix path
tf_backend_prefix="your_preferred_prefix" 

# apply the terraform
terraform apply -var folder_id="${tf_folder_id}" -var billing_account="${tf_billing_account}" -var owner_email="${tf_owner_email}" -var backend_bucket_name="${tf_backend_bucket_name}"
```

Then simply use that to apply:

```bash
sh ./tfapply.sh
```