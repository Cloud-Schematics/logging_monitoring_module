##############################################################################
# Create Activity Tracker
##############################################################################

resource "ibm_resource_instance" "activity_tracker" {
  count             = var.create_activity_tracker == true ? 1 : 0
  name              = "${var.prefix}-activity-tracker"
  service           = "logdnaat"
  plan              = lookup(var.logdna, "plan", null)
  location          = var.region
  resource_group_id = var.resource_group_id
  parameters = {
    service-endpoints = var.service_endpoints
  }

  tags = var.tags
}
##############################################################################


##############################################################################
# LogDNA
##############################################################################

data "ibm_resource_instance" "logdna" {
  count             = var.logdna.use_data == true ? 1 : 0
  name              = var.logdna.name
  resource_group_id = lookup(var.logdna, "resource_group_id", var.resource_group_id)
  service           = "logdna"
}

resource "ibm_resource_instance" "logdna" {
  count             = var.logdna.use_data == null || var.logdna.use_data == false ? 1 : 0
  name              = var.logdna.name == null ? "${var.prefix}-logdna" : var.logdna.name
  location          = var.region
  plan              = lookup(var.logdna, "plan", null)
  resource_group_id = lookup(var.logdna, "resource_group_id", var.resource_group_id)
  service           = "logdna"
  service_endpoints = var.service_endpoints
  tags              = var.tags
}

##############################################################################


##############################################################################
# Sysdig
##############################################################################

data "ibm_resource_instance" "sysdig" {
  count             = var.sysdig.use_data == true ? 1 : 0
  name              = var.sysdig.name
  resource_group_id = lookup(var.sysdig, "resource_group_id", var.resource_group_id)
  service           = "sysdig-monitor"
}

resource "ibm_resource_instance" "sysdig" {
  count             = var.sysdig.use_data == null || var.sysdig.use_data == false ? 1 : 0
  name              = var.sysdig.name == null ? "${var.prefix}-sysdig" : var.sysdig.name
  location          = var.region
  plan              = lookup(var.sysdig, "plan", null)
  resource_group_id = lookup(var.sysdig, "resource_group_id", var.resource_group_id)
  service           = "sysdig-monitor"
  service_endpoints = var.service_endpoints
}

##############################################################################