##############################################################################
# Outputs
##############################################################################

output logdna_crn {
    description = "Logdna CRN"
    value       = ibm_resource_instance.logdna.crn
}

output logdna_guid {
    description = "Logdna GUID"
    value       = ibm_resource_instance.logdna.guid
}

output sysdig_crn {
    description = "Sysdig CRN"
    value       = ibm_resource_instance.sysdig.crn
}

output sysdig_guid {
    description = "Sysdig GUID"
    value       = ibm_resource_instance.sysdig.crn
}

##############################################################################