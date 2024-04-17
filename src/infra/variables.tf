variable "gcp_project" {
  description = "The project to deploy these resources to"
  type = string
}

variable "gcp_region" {
  description = "The region to deploy to"
  type = string
}

variable "gcp_zone" {
  description = "The Zone to deploy to"
  type = string
}

variable "registry_name" {
  description = "The name of the GCP registry to be created"
  type = string
}

