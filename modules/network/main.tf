resource "oci_core_vcn" "this" {
  compartment_id = var.compartment_id

  display_name = var.vcn_name
  cidr_block   = var.vcn_cidr
  dns_label    = var.vcn_dns_label
}

resource "oci_core_subnet" "this" {
  for_each = var.subnets

  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.this.id

  display_name = each.value.name
  cidr_block   = each.value.cidr
  dns_label    = each.value.dns_label

  prohibit_public_ip_on_vnic = true
}