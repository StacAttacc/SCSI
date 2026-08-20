variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "resource_group_name" {
  type    = string
  default = "rg-s-valitiana-dev"
}

variable "location" {
  type = string
  default = "East US"
}

variable "static_web_app_location" {
  type = string
  default = "East US 2"
}

variable "static_web_app_name" {
  type    = string
  default = "swa-scsi-prod"
}

variable "tags" {
  type = map(string)
  default = {
    environment = "prod"
    managed-by = "terraform"
    owner = "scsi"
  }
}
