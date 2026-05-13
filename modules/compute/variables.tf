variable "tenancy_ocid" {
  description = "OCI tenancy OCID"
  type        = string
}

variable "compartment_ocid" {
  description = "OCI compartment OCID"
  type        = string
}

variable "public_subnet_id" {
  description = "Subnet OCID where the compute instance will be created"
  type        = string
}

variable "ssh_public_key" {
  description = "SSH public key for the compute instance"
  type        = string
  sensitive   = true
}