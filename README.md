Terraform module which creates monitor of Prometheus on Alibaba Cloud.

terraform-alicloud-prometheus
=====================================================================

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-prometheus/blob/master/README-CN.md)

Terraform module which creates monitor of Prometheus on Alibaba Cloud.

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

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.237.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | >= 1.237.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_arms_alert_contact_group.arms_alert_contact_group](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/arms_alert_contact_group) | resource |
| [alicloud_arms_dispatch_rule.arms_dispatch_rule](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/arms_dispatch_rule) | resource |
| [alicloud_arms_prometheus_alert_rule.arms_prometheus_alert_rule](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/arms_prometheus_alert_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alert_contact_group_name"></a> [alert\_contact\_group\_name](#input\_alert\_contact\_group\_name) | The name of arms contract group. | `string` | `null` | no |
| <a name="input_alert_duration"></a> [alert\_duration](#input\_alert\_duration) | The duration of the alert. | `string` | `"1"` | no |
| <a name="input_alert_expression"></a> [alert\_expression](#input\_alert\_expression) | The alert expression of prometheus. | `string` | `""` | no |
| <a name="input_alert_message"></a> [alert\_message](#input\_alert\_message) | The alert message of prometheus. | `string` | `""` | no |
| <a name="input_alert_name"></a> [alert\_name](#input\_alert\_name) | The alert name of prometheus. | `string` | `""` | no |
| <a name="input_alert_notify_type"></a> [alert\_notify\_type](#input\_alert\_notify\_type) | The notify type of prometheus. | `string` | `"DISPATCH_RULE"` | no |
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | The ID of the cluster. | `string` | `""` | no |
| <a name="input_contact_ids"></a> [contact\_ids](#input\_contact\_ids) | The ids of arms contract. | `list(string)` | `[]` | no |
| <a name="input_create"></a> [create](#input\_create) | Whether to create resources in module. | `bool` | `false` | no |
| <a name="input_create_dispatch_rule"></a> [create\_dispatch\_rule](#input\_create\_dispatch\_rule) | Whether to create arms dispatch rule in module. | `bool` | `true` | no |
| <a name="input_create_prometheus_alert_rule"></a> [create\_prometheus\_alert\_rule](#input\_create\_prometheus\_alert\_rule) | Whether to create prometheus alert rule. | `bool` | `true` | no |
| <a name="input_dispatch_rule_name"></a> [dispatch\_rule\_name](#input\_dispatch\_rule\_name) | The rule name of dispatch. | `string` | `""` | no |
| <a name="input_dispatch_type"></a> [dispatch\_type](#input\_dispatch\_type) | The type of dispatch. | `string` | `"CREATE_ALERT"` | no |
| <a name="input_group_interval"></a> [group\_interval](#input\_group\_interval) | The interval time of arms contract group. | `number` | `0` | no |
| <a name="input_group_wait_time"></a> [group\_wait\_time](#input\_group\_wait\_time) | The waiting time of arms contract group. | `number` | `0` | no |
| <a name="input_grouping_fields"></a> [grouping\_fields](#input\_grouping\_fields) | The files of arms contract group. | `list(string)` | `[]` | no |
| <a name="input_match_expressions"></a> [match\_expressions](#input\_match\_expressions) | The lable of match expresoins. | <pre>list(object({<br>    key      = string<br>    value    = string<br>    operator = string<br>  }))</pre> | `[]` | no |
| <a name="input_notification_name"></a> [notification\_name](#input\_notification\_name) | The name of arms notification. | `string` | `""` | no |
| <a name="input_notify_channels"></a> [notify\_channels](#input\_notify\_channels) | The name of arms notification. | `list(string)` | <pre>[<br>  "dingTalk",<br>  "wechat"<br>]</pre> | no |
| <a name="input_notify_end_time"></a> [notify\_end\_time](#input\_notify\_end\_time) | The end time of arms notification. | `string` | `null` | no |
| <a name="input_notify_start_time"></a> [notify\_start\_time](#input\_notify\_start\_time) | The start time of arms notification. | `string` | `null` | no |
| <a name="input_notify_type"></a> [notify\_type](#input\_notify\_type) | The type of the alert contact. Valid values: ARMS\_CONTACT: contact. ARMS\_CONTACT\_GROUP: contact group. | `string` | `"ARMS_CONTACT_GROUP"` | no |
| <a name="input_prometheus_type"></a> [prometheus\_type](#input\_prometheus\_type) | The type information of prometheus. | `string` | `""` | no |
| <a name="input_repeat_interval"></a> [repeat\_interval](#input\_repeat\_interval) | The repeat interval time of arms contract group. | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this_prometheus_alert_rule"></a> [this\_prometheus\_alert\_rule](#output\_this\_prometheus\_alert\_rule) | The alert rule ID of prometheus. |
<!-- END_TF_DOCS -->

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