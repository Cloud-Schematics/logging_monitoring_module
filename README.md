# IBM Cloud Logging and Monitoring

This module allows users to create or load from data a logdna and sysdig instance. This module can optionally also provision activity tracker.

## Module Variables

Name                      | Type                                                                                                                       | Description                                                                                                                                                                                                                                                         | Sensitive | Default
------------------------- | -------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------- | ---------------------------------
prefix                    | string                                                                                                                     | A unique identifier for resources. Must begin with a letter. This prefix will be prepended to any resources provisioned by th  is template.                                                                                                                           |           | gcat-multizone-schematics
region                    | string                                                                                                                     | Region where resources will be created                                                                                                                                                                                                                                |           | us-south
resource_group_id         | string                                                                                                                     | Resource group ID to use for all services created                                                                                                                                                                                                                     |           | 
tags                      | list(string)                                                                                                               | A list of tags to be added to resources                                                                                                                                                                                                                               |           | ["fs-cloud-refarch"]
service_endpoints         | string                                                                                                                     | Service endpoints. Can be `public`, `private`, or `public-and-private`                                                                                                                                                                                                |           | private
sysdig                    | object({ name = optional(string) use_data = optional(bool) plan = optional(string) resource_group_id = optional(string) }) | Object describing sysdig deployment. If use data is false and name is not used, a name will be automatically generated. A pla  n is only required on creation of an instance. If no resource group ID is provided, resource will use `var.resource_group_id` instead. |           | {<br>plan = "graduated-tier"<br>}
logdna                    | object({ name = optional(string) use_data = optional(bool) plan = optional(string) resource_group_id = optional(string) }) | Object describing logdna deployment. If use data is false and name is not used, a name will be automatically generated. A pla  n is only required on creation of an instance. If no resource group ID is provided, resource will use `var.resource_group_id` instead. |           | {<br>plan = "7-day"<br>}
create_activity_tracker   | bool                                                                                                                       | Create activity tracker. Only one instance of activity tracker can be provisioned per region in each account.                  

---                                                                                                                | Create activity tracker. Only one instance of activity tracker can be provisioned per region in each account.                                                                                                                                                       |           | false

## Example Usage

```terraform
module logging_and_monitoring {
  source                  = "github.com/Cloud-Schematics/logging_monitoring_module.git"
  prefix                  = var.prefix
  region                  = var.region
  resource_group_id       = var.resource_group_id
  tags                    = var.tags
  service_endpoints       = var.service_endpoints
  sysdig                  = var.sysdig
  logdna                  = var.logdna
  create_activity_tracker = var.create_activity_tracker
}
```