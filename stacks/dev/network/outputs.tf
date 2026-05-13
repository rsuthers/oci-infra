output "instance_public_ip" {
  value = oci_core_instance.demo_instance.public_ip
}

output "instance_name" {
  value = oci_core_instance.demo_instance.display_name
}
