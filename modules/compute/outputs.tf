output "instance_id" {
  description = "Compute instance OCID"
  value       = oci_core_instance.demo_instance.id
}