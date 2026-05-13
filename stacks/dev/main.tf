module "compartments" {
  source = "../../modules/compartments"

  tenancy_ocid  = var.tenancy_ocid
  enable_delete = false
}

module "network" {
  source = "../../modules/network"

  compartment_ocid = module.compartments.network_compartment_id
}

module "compute" {
  source = "../../modules/compute"

  tenancy_ocid     = var.tenancy_ocid
  compartment_ocid = module.compartments.non_prod_compartment_id
  ssh_public_key   = var.ssh_public_key
  public_subnet_id = module.network.public_subnet_id
}