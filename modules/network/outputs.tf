output "vcn_id" {
  value = oci_core_vcn.this.id
}

output "vcn_name" {
  value = oci_core_vcn.this.display_name
}

output "subnet_ids" {
  value = {
    for key, subnet in oci_core_subnet.this : key => subnet.id
  }
}

output "subnet_names" {
  value = {
    for key, subnet in oci_core_subnet.this : key => subnet.display_name
  }
}