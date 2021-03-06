# Configure the OpenStack Provider
provider "openstack" {
  version                       = "~> v1.19.0"
  domain_name                   = var.domain_name
  user_domain_name              = var.user_domain_name != "" ? var.user_domain_name : var.domain_name
  auth_url                      = var.auth_url
  region                        = var.region
  application_credential_name   = var.application_credential_name
  application_credential_id     = var.application_credential_id
  application_credential_secret = var.application_credential_secret
}

module "vpc" {
  source  = "./vpc"
  petname = random_pet.pet.id
}

module "instance" {
  instance_name   = "vm"
  source          = "./instance"
  sec_name                       = module.vpc.sec_name
  petname         = random_pet.pet.id
  DOCKER_PASSWORD = var.DOCKER_PASSWORD
  DOCKER_USERNAME = var.DOCKER_USERNAME
  REPOSITORY_PATH                = var.REPOSITORY_PATH
  SSL_POLICY                     = var.SSL_POLICY
  ENABLE_IPV6                    = var.ENABLE_IPV6
  DNS_HOST = var.DNS_HOST
  DNS_USERNAME = var.DNS_USERNAME
  DNS_PASSWORD = var.DNS_PASSWORD
  CERTS_PATH = var.CERTS_PATH
}

output "ip" {
  value = module.instance.ip
}
