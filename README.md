Terraform module which creates monitor of Prometheus on Alibaba Cloud.

terraform-alicloud-prometheus
=====================================================================

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-prometheus/blob/master/README-CN.md)

Terraform module which creates monitor of Prometheus on Alibaba Cloud.

These types of resources are supported:

* [Arms_Alert_Contact_Group](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/arms_alert_contact_group)
* [Arms_Dispatch_Rule](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/arms_dispatch_rule)
* [Arms_Prometheus_Alert_Rule](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/arms_prometheus_alert_rule)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.131.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | >= 1.131.0 |

## Usage

```hcl
resource "alicloud_arms_alert_contact" "default" {
  alert_contact_name = "example_value"
  email              = "example_value@aaa.com"
}

data "alicloud_cs_managed_kubernetes_clusters" "default" {
  name_regex  = "tf_Acc"
}

module "example" {
  source            = "terraform-alicloud-modules/prometheus/alicloud"
  contact_ids       = [alicloud_arms_alert_contact.default.id]
  cluster_id   =      data.alicloud_cs_managed_kubernetes_clusters.default.id
  match_expressions = [{ key = "aliyun_arms_involvedObject_kind", value = "app", operator = "eq" }]
}
```

Submit Issues
-------------
If you have any problems when using this module, please opening a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend to open an issue on this repo.

Authors
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)