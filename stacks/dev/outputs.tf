output "vcn_id" {
  description = "VCN OCID"
  value       = module.network.vcn_id
}

output "public_subnet_id" {
  description = "Public subnet OCID"
  value       = module.network.public_subnet_id
}

output "compute_instance_id" {
  description = "Compute instance OCID"
  value       = module.compute.instance_id
}

output "environments_compartment_id" {
  value = module.compartments.environments_compartment_id
}

output "uat_compartment_id" {
  value = module.compartments.uat_compartment_id
}

output "non_prod_compartment_id" {
  value = module.compartments.non_prod_compartment_id
}

output "sandpit_compartment_id" {
  value = module.compartments.sandpit_compartment_id
}

output "production_compartment_id" {
  value = module.compartments.production_compartment_id
}

output "network_compartment_id" {
  value = module.compartments.network_compartment_id
}

output "management_compartment_id" {
  value = module.compartments.management_compartment_id
}

output "security_compartment_id" {
  value = module.compartments.security_compartment_id
}