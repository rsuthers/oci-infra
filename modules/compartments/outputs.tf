output "network_compartment_id" {
  value = oci_identity_compartment.network.id
}

output "environment_compartment_id" {
  value = oci_identity_compartment.environment.id
}

output "sandpit_compartment_id" {
  value = oci_identity_compartment.sandpit.id
}

output "non_prod_compartment_id" {
  value = oci_identity_compartment.non_prod.id
}

output "uat_compartment_id" {
  value = oci_identity_compartment.uat.id
}

output "production_compartment_id" {
  value = oci_identity_compartment.production.id
}

output "management_compartment_id" {
  value = oci_identity_compartment.management.id
}

output "security_compartment_id" {
  value = oci_identity_compartment.security.id
}