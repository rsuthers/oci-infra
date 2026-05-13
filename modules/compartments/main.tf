resource "oci_identity_compartment" "environments" {
  compartment_id = var.tenancy_ocid
  name           = "Environments"
  description    = "Parent compartment for environment-specific compartments"
  enable_delete  = var.enable_delete
}

resource "oci_identity_compartment" "uat" {
  compartment_id = oci_identity_compartment.environments.id
  name           = "UAT"
  description    = "UAT environment compartment"
  enable_delete  = var.enable_delete
}

resource "oci_identity_compartment" "non_prod" {
  compartment_id = oci_identity_compartment.environments.id
  name           = "Non-Prod"
  description    = "Non-production environment compartment"
  enable_delete  = var.enable_delete
}

resource "oci_identity_compartment" "sandpit" {
  compartment_id = oci_identity_compartment.environments.id
  name           = "Sandpit"
  description    = "Sandpit environment compartment"
  enable_delete  = var.enable_delete
}

resource "oci_identity_compartment" "production" {
  compartment_id = oci_identity_compartment.environments.id
  name           = "Production"
  description    = "Production environment compartment"
  enable_delete  = var.enable_delete
}

resource "oci_identity_compartment" "network" {
  compartment_id = var.tenancy_ocid
  name           = "Network"
  description    = "Central networking compartment"
  enable_delete  = var.enable_delete
}

resource "oci_identity_compartment" "management" {
  compartment_id = var.tenancy_ocid
  name           = "Management"
  description    = "Management and shared services compartment"
  enable_delete  = var.enable_delete
}

resource "oci_identity_compartment" "security" {
  compartment_id = var.tenancy_ocid
  name           = "Security"
  description    = "Security services and monitoring compartment"
  enable_delete  = var.enable_delete
}