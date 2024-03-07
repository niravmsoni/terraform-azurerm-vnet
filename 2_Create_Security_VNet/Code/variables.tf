variable "sec_resource_group_name" {
  type    = string
  default = "security"
}

variable "location" {
  type    = string
  default = "eastus"
}

# Ensure to keep this range different from main VNet
variable "vnet_cidr_range" {
  type    = string
  default = "10.1.0.0/16"
}


variable "sec_subnet_prefixes" {
  type    = list(string)
  default = ["10.1.0.0/24", "10.1.1.0/24"]
}

variable "sec_subnet_names" {
  type    = list(string)
  default = ["siem", "inspect"]
}