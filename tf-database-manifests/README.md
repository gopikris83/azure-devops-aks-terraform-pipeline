# Provision Azure AD Group and Azure Database for MySQL

## Step-01: Introduction
- Create resource group and storage account with container for storing the tf state through Azure CLI
- Create Azure AD Group and Azure Database for MySQL using Terraform manifests
```
## Terraform uses Init/Plan/Apply
  $ terraform init
  $ terraform plan
  $terraform apply

# Finally delete the Azure resources using 
  $ terraform destroy
```
# Follow the steps to connect the Azure Database for MySQL Server using Azure AD
  [Reference] (https://winsmarts.com/super-easy-way-to-get-an-access-token-ddb9e56bcdf)