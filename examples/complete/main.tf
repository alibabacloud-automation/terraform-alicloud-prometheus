data "alicloud_cs_managed_kubernetes_clusters" "default" {
}

resource "alicloud_arms_alert_contact" "default" {
  alert_contact_name = var.alert_contact_name
  email              = var.email
}

module "example" {
  source = "../.."

  #alicloud_arms_alert_contact_group
  create = true

  alert_contact_group_name = var.alert_contact_group_name
  contact_ids              = [alicloud_arms_alert_contact.default.id]

  #alicloud_arms_dispatch_rule
  dispatch_rule_name = var.dispatch_rule_name
  dispatch_type      = var.dispatch_type
  group_wait_time    = var.group_wait_time
  group_interval     = var.group_interval
  repeat_interval    = var.repeat_interval
  grouping_fields    = var.grouping_fields
  match_expressions = [
    {
      key      = "_aliyun_arms_alert_name",
      value    = "tf-testacc-app",
      operator = "eq"
    }
  ]
  notify_type       = var.notify_type
  notification_name = var.notification_name
  notify_channels   = var.notify_channels

  #alicloud_arms_prometheus_alert_rule
  alert_name        = "tf-testacc-alert"
  cluster_id        = data.alicloud_cs_managed_kubernetes_clusters.default.clusters.0.id
  alert_expression  = "node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes * 100 < 10"
  alert_message     = "node available memory is less than 10%"
  alert_duration    = "1"
  alert_notify_type = var.alert_notify_type
  prometheus_type   = "alert"

}