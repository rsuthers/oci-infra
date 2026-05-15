variable "compartment_id" {
  description = "Compartment OCID where the VCN will be created"
  type        = string
}

variable "vcn_name" {
  description = "VCN display name"
  type        = string
}

variable "vcn_cidr" {
  description = "VCN CIDR block"
  type        = string
}

variable "vcn_dns_label" {
  description = "VCN DNS label"
  type        = string
}

variable "subnets" {
  description = "Map of subnet definitions"
  type = map(object({
    name      = string
    cidr      = string
    dns_label = string
  }))
}