output "vcn_id" {
  description = "VCN OCID"
  value       = oci_core_vcn.demo_vcn.id
}

output "public_subnet_id" {
  description = "Public subnet OCID"
  value       = oci_core_subnet.demo_public_subnet.id
}