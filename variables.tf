##############################################################################
# Variables
##############################################################################

variable "prefix" {
  description = "A unique identifier for resources. Must begin with a letter. This prefix will be prepended to any resources provisioned by this template."
  type        = string
  default     = "gcat-multizone-schematics"

  validation {
    error_message = "Prefix must begin and end with a letter and contain only letters, numbers, and - characters."
    condition     = can(regex("^([A-z]|[a-z][-a-z0-9]*[a-z0-9])$", var.prefix))
  }
}

variable "region" {
  description = "Region where resources will be created"
  type        = string
  default     = "us-south"
}

variable "resource_group_id" {
  description = "Resource group ID to use for all services created"
  type        = string
}

variable "tags" {
  description = "A list of tags to be added to resources"
  type        = list(string)
  default     = ["fs-cloud-refarch"]
}

variable "service_endpoints" {
  description = "Service endpoints. Can be `public`, `private`, or `public-and-private`"
  type        = string
  default     = "private"

  validation {
    error_message = "Service endpoints can only be `public`, `private`, or `public-and-private`."
    condition     = contains(["public", "private", "public-and-private"], var.service_endpoints)
  }
}

variable "sysdig" {
  description = "Object describing sysdig deployment. If use data is false and name is not used, a name will be automatically generated. A plan is only required on creation of an instance. If no resource group ID is provided, resource will use `var.resource_group_id` instead."
  type = object({
    name              = optional(string)
    use_data          = optional(bool)
    plan              = optional(string)
    resource_group_id = optional(string)
  })

  default = {
    plan = "graduated-tier"
  }

  validation {
    error_message = "Can only be `graduated-tier` or `graduated-tier-sysdig-secure-plus-monitor`."
    condition     = contains(["graduated-tier", "graduated-tier-sysdig-secure-plus-monitor"], var.sysdig.plan) || var.sysdig.plan == null && var.sysdig.use_data == true
  }

  validation {
    error_message = "Plan should be `null` if `use_data` is true. `use_data` should be `false` or `null` if plan is used."
    condition = (
      var.sysdig.use_data == true && var.sysdig.plan == null
      ) || (
      (
        var.sysdig.use_data == false || var.sysdig.use_data == null
      ) && var.sysdig.plan != null
    )
  }
}

variable "logdna" {
  description = "Object describing logdna deployment. If use data is false and name is not used, a name will be automatically generated. A plan is only required on creation of an instance. If no resource group ID is provided, resource will use `var.resource_group_id` instead."
  type = object({
    name              = optional(string)
    use_data          = optional(bool)
    plan              = optional(string)
    resource_group_id = optional(string)
  })

  default = {
    plan = "7-day"
  }


  validation {
    error_message = "Can only be `14-day`, `30-day`, `7-day`, or `hipaa-30-day`."
    condition     = contains(["14-day", "30-day", "7-day", "hipaa-30-day"], var.logdna.plan) || var.logdna.plan == null
  }

  validation {
    error_message = "Plan should be `null` if `use_data` is true. `use_data` should be `false` or `null` if plan is used."
    condition = (
      var.logdna.use_data == true && var.logdna.plan == null
      ) || (
      (
        var.logdna.use_data == false || var.logdna.use_data == null
      ) && var.logdna.plan != null
    )
  }
}

variable "create_activity_tracker" {
  description = "Create activity tracker. Only one instance of activity tracker can be provisioned per region in each account."
  type        = bool
  default     = false
}


##############################################################################