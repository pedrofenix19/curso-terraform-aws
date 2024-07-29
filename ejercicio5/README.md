```
terraform init

terraform workspace select -or-create dev

terraform plan -var-file=dev.tfvars

terraform apply -var-file=dev.tfvars
```