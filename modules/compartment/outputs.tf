output "environments_compartment_id" {
  description = "OCID of the Environments parent compartment"
  value       = oci_identity_compartment.environments.id
}

output "uat_compartment_id" {
  description = "OCID of the UAT compartment"
  value       = oci_identity_compartment.uat.id
}

output "non_prod_compartment_id" {
  description = "OCID of the Non-Prod compartment"
  value       = oci_identity_compartment.non_prod.id
}

output "sandpit_compartment_id" {
  description = "OCID of the Sandpit compartment"
  value       = oci_identity_compartment.sandpit.id
}

output "production_compartment_id" {
  description = "OCID of the Production compartment"
  value       = oci_identity_compartment.production.id
}

output "network_compartment_id" {
  description = "OCID of the Network compartment"
  value       = oci_identity_compartment.network.id
}

output "management_compartment_id" {
  description = "OCID of the Management compartment"
  value       = oci_identity_compartment.management.id
}

output "security_compartment_id" {
  description = "OCID of the Security compartment"
  value       = oci_identity_compartment.security.id
}