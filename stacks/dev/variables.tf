variable "tenancy_ocid" {
  description = "OCI tenancy OCID"
  type        = string
}

variable "compartment_ocid" {
  description = "OCI compartment OCID"
  type        = string
}

variable "region" {
  description = "OCI region"
  type        = string
}

variable "ssh_public_key" {
  description = "SSH public key for the compute instance"
  type        = string
  sensitive   = true
}