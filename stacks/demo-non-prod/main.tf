module "compartments" {
  source = "../../modules/compartments"

  tenancy_ocid = var.tenancy_ocid
}

module "non_prod_network" {
  source = "../../modules/network"

  compartment_id = module.compartments.non_prod_compartment_id

  vcn_name      = "VCN-DEMO-NonProd"
  vcn_cidr      = var.vcn_cidr
  vcn_dns_label = "demononprod"

  subnets = {
    application = {
      name      = "SN-VCN-DEMO-NonProd-Application"
      cidr      = var.application_subnet_cidr
      dns_label = "app"
    }

    database = {
      name      = "SN-VCN-DEMO-NonProd-Database"
      cidr      = var.database_subnet_cidr
      dns_label = "db"
    }

    storage = {
      name      = "SN-VCN-DEMO-NonProd-Storage"
      cidr      = var.storage_subnet_cidr
      dns_label = "storage"
    }

    integration = {
      name      = "SN-VCN-DEMO-NonProd-Integration"
      cidr      = var.integration_subnet_cidr
      dns_label = "int"
    }
  }
}