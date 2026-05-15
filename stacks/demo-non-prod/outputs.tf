output "network_compartment_id" {
  value = module.compartments.network_compartment_id
}

output "environment_compartment_id" {
  value = module.compartments.environment_compartment_id
}

output "non_prod_compartment_id" {
  value = module.compartments.non_prod_compartment_id
}

output "vcn_id" {
  value = module.non_prod_network.vcn_id
}

output "vcn_name" {
  value = module.non_prod_network.vcn_name
}

output "subnet_ids" {
  value = module.non_prod_network.subnet_ids
}

output "subnet_names" {
  value = module.non_prod_network.subnet_names
}