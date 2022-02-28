##############################################################################
# Outputs
##############################################################################

output "logdna_crn" {
  description = "Logdna CRN"
  value       = var.logdna.use_data == true ? data.ibm_resource_instance.logdna[0].crn : ibm_resource_instance.logdna[0].crn
}

output "logdna_guid" {
  description = "Logdna GUID"
  value       = var.logdna.use_data == true ? data.ibm_resource_instance.logdna[0].guid : ibm_resource_instance.logdna[0].guid
}

output "sysdig_crn" {
  description = "Sysdig CRN"
  value       = var.sysdig.use_data == true ? data.ibm_resource_instance.sysdig[0].crn : ibm_resource_instance.sysdig[0].crn
}

output "sysdig_guid" {
  description = "Sysdig GUID"
  value       = var.sysdig.use_data == true ? data.ibm_resource_instance.sysdig[0].guid : ibm_resource_instance.sysdig[0].guid
}

##############################################################################