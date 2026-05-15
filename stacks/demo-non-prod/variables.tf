variable "region" {
  description = "OCI region, for example uk-london-1"
  type        = string
}

variable "tenancy_ocid" {
  description = "Root tenancy OCID"
  type        = string
}

variable "vcn_cidr" {
  description = "CIDR block for VCN-DEMO-NonProd"
  type        = string
  default     = "10.50.0.0/16"
}

variable "application_subnet_cidr" {
  description = "CIDR block for Application subnet"
  type        = string
  default     = "10.50.10.0/24"
}

variable "database_subnet_cidr" {
  description = "CIDR block for Database subnet"
  type        = string
  default     = "10.50.20.0/24"
}

variable "storage_subnet_cidr" {
  description = "CIDR block for Storage subnet"
  type        = string
  default     = "10.50.30.0/24"
}

variable "integration_subnet_cidr" {
  description = "CIDR block for Integration subnet"
  type        = string
  default     = "10.50.40.0/24"
}