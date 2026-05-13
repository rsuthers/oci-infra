resource "oci_core_vcn" "demo_vcn" {
  compartment_id = module.compartments.network_compartment_id
  cidr_block     = "10.0.0.0/16"
  display_name   = "demo-test-vcn"
  dns_label      = "demotestvcn"
}

resource "oci_core_internet_gateway" "demo_igw" {
  compartment_id = module.compartments.network_compartment_id
  vcn_id         = oci_core_vcn.demo_vcn.id
  display_name   = "demo-test-igw"
  enabled        = true
}

resource "oci_core_route_table" "demo_rt" {
  compartment_id = module.compartments.network_compartment_id
  vcn_id         = oci_core_vcn.demo_vcn.id
  display_name   = "demo-test-rt"

  route_rules {
    network_entity_id = oci_core_internet_gateway.demo_igw.id
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
  }
}

resource "oci_core_security_list" "demo_sl" {
  compartment_id = module.compartments.network_compartment_id
  vcn_id         = oci_core_vcn.demo_vcn.id
  display_name   = "demo-test-sl"

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      min = 22
      max = 22
    }
  }
}

resource "oci_core_subnet" "demo_public_subnet" {
  compartment_id             = module.compartments.network_compartment_id
  vcn_id                     = oci_core_vcn.demo_vcn.id
  cidr_block                 = "10.0.1.0/24"
  display_name               = "demo-public-subnet"
  dns_label                  = "publicsubnet"
  route_table_id             = oci_core_route_table.demo_rt.id
  security_list_ids          = [oci_core_security_list.demo_sl.id]
  prohibit_public_ip_on_vnic = false
}