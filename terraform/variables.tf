variable "domain_name" {
  # https://www.terraform.io/docs/providers/openstack/#domain_name
  type = string
}

variable "user_domain_name" {
  # https://www.terraform.io/docs/providers/openstack/#user_domain_name
  type    = string
  default = ""
}

variable "application_credential_name" {
  type = string
}

variable "application_credential_id" {
  type = string
}

variable "application_credential_secret" {
  type = string
}

variable "project_id" {
  type = string
}

variable "auth_url" {
  type = string
}

variable "region" {
  type    = string
  default = "Karlsruhe"
}

# remote state
# see https://www.ibm.com/cloud/blog/store-terraform-states-cloud-object-storage

terraform {
  backend "s3" {
    bucket                      = "d7de77575e05b2f4218ebb0ea9321efc"
    key                         = "remote_states/hska-tgl-terraform-remote.tfstate"
    region                      = "eu-de"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_get_ec2_platforms      = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    endpoint                    = "s3.eu-de.cloud-object-storage.appdomain.cloud"
  }
}

