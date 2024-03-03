# Terraform with Azure Provider
- Authentication using Client ID and Client Secret. Refer [this]()
- Once done, execute core TF workflow
    - terraform init
    - terraform plan -var resource_group_name=main-vnet -out vnet.tfplan
        - Since there is a single variable, declared it inline here
    - terraform apply "vnet.tfplan"
    - terraform destroy