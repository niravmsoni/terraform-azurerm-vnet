# Terraform with Azure Provider
- Authentication using Client ID and Client Secret. Refer [this](Content/4_Steps_To_Run_TF_Locally.md)
- Once done, execute core TF workflow
- terraform init
      
  ![image](https://github.com/niravmsoni/terraform-on-azure/assets/6556021/8b976878-0b7b-4e1b-a08f-700372221c39)

- terraform plan -var resource_group_name=main-vnet -out vnet.tfplan

![image](https://github.com/niravmsoni/terraform-on-azure/assets/6556021/0643975e-84bc-4842-a7f8-76cf88599827)
![image](https://github.com/niravmsoni/terraform-on-azure/assets/6556021/5e989e53-a452-4c33-89db-269a2f111ff1)

- terraform apply "vnet.tfplan"

![image](https://github.com/niravmsoni/terraform-on-azure/assets/6556021/d3a568e2-53c0-4056-8cb5-e8b9591c2534)

RG

![image](https://github.com/niravmsoni/terraform-on-azure/assets/6556021/3f6ff304-3f18-4875-a3dd-3f1e84c09287)

VNet

![image](https://github.com/niravmsoni/terraform-on-azure/assets/6556021/6e089f99-bbd1-41b6-aaa9-88cb8bb8ed2f)

Subnets

![image](https://github.com/niravmsoni/terraform-on-azure/assets/6556021/5922bc51-10a7-4cb8-800a-c6b612d3baa0)

- terraform destroy

![image](https://github.com/niravmsoni/terraform-on-azure/assets/6556021/b3860d70-1020-490e-990a-5cba8f92c237)
