variable "tenancy_ocid" {
  description = "The OCID of the tenancy root compartment"
  type        = string
}

variable "enable_delete" {
  description = "Whether compartments can be deleted by Terraform"
  type        = bool
  default     = false
}