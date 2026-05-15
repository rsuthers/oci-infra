resource "oci_identity_compartment" "network" {
  compartment_id = var.tenancy_ocid
  name           = "Network"
  description    = "Shared and transit network services"
  enable_delete  = true
}

resource "oci_identity_compartment" "environment" {
  compartment_id = var.tenancy_ocid
  name           = "Environment"
  description    = "Workload environment landing zones"
  enable_delete  = true
}

resource "oci_identity_compartment" "management" {
  compartment_id = var.tenancy_ocid
  name           = "Management"
  description    = "Management, automation and operational tooling"
  enable_delete  = true
}

resource "oci_identity_compartment" "security" {
  compartment_id = var.tenancy_ocid
  name           = "Security"
  description    = "Security, audit and governance services"
  enable_delete  = true
}

resource "oci_identity_compartment" "sandpit" {
  compartment_id = oci_identity_compartment.environment.id
  name           = "Sandpit"
  description    = "Sandbox and proof-of-concept workloads"
  enable_delete  = true
}

resource "oci_identity_compartment" "non_prod" {
  compartment_id = oci_identity_compartment.environment.id
  name           = "Non-Prod"
  description    = "Non-production workloads"
  enable_delete  = true
}

resource "oci_identity_compartment" "uat" {
  compartment_id = oci_identity_compartment.environment.id
  name           = "UAT"
  description    = "User acceptance testing workloads"
  enable_delete  = true
}

resource "oci_identity_compartment" "production" {
  compartment_id = oci_identity_compartment.environment.id
  name           = "Production"
  description    = "Production workloads"
  enable_delete  = true
}