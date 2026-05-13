variable "tenancy_ocid" {
  type = string
}

variable "compartment_ocid" {
  type = string
}

variable "region" {
  type    = string
  default = "uk-london-1"
}

variable "ssh_public_key" {
  type        = string
  description = "Paste your SSH public key contents"
}
