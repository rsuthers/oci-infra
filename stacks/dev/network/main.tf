data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_ocid
}

data "oci_core_images" "oracle_linux" {
  compartment_id           = var.compartment_ocid
  operating_system         = "Oracle Linux"
  operating_system_version = "8"
  shape                    = "VM.Standard.E2.1.Micro"

  sort_by    = "TIMECREATED"
  sort_order = "DESC"
}

resource "oci_core_vcn" "demo_vcn" {
  compartment_id = var.compartment_ocid
  cidr_block     = "10.0.0.0/16"
  display_name   = "demo-test-vcn"
  dns_label      = "demotestvcn"
}

resource "oci_core_internet_gateway" "demo_igw" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.demo_vcn.id
  display_name   = "demo-test-igw"
  enabled        = true
}

resource "oci_core_route_table" "demo_rt" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.demo_vcn.id
  display_name   = "demo-test-rt"

  route_rules {
    network_entity_id = oci_core_internet_gateway.demo_igw.id
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
  }
}

resource "oci_core_security_list" "demo_sl" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.demo_vcn.id
  display_name   = "demo-test-sl"

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol = "6" # TCP
    source   = "0.0.0.0/0"

    tcp_options {
      min = 22
      max = 22
    }
  }
}

resource "oci_core_subnet" "demo_public_subnet" {
  compartment_id      = var.compartment_ocid
  vcn_id              = oci_core_vcn.demo_vcn.id
  cidr_block          = "10.0.1.0/24"
  display_name        = "demo-public-subnet"
  dns_label           = "publicsubnet"
  route_table_id      = oci_core_route_table.demo_rt.id
  security_list_ids   = [oci_core_security_list.demo_sl.id]
  prohibit_public_ip_on_vnic = false
}

resource "oci_core_instance" "demo_instance" {
  compartment_id      = var.compartment_ocid
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  display_name        = "demo-test-instance"
  shape               = "VM.Standard.E2.1.Micro"

  create_vnic_details {
    subnet_id        = oci_core_subnet.demo_public_subnet.id
    assign_public_ip = true
    display_name     = "demo-test-vnic"
    hostname_label   = "demotestvm"
  }

  source_details {
    source_type = "image"
    source_id   = data.oci_core_images.oracle_linux.images[0].id
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
  }
}
