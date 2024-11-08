resource "random_integer" "default" {
  min = 100000
  max = 999999
}

resource "alicloud_arms_prometheus" "default" {
  cluster_type        = "remote-write"
  cluster_name        = "tf-example-${random_integer.default.result}"
  grafana_instance_id = "free"
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
  dispatch_rule_name = "${var.dispatch_rule_name}-${random_integer.default.result}"
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

  create_prometheus_alert_rule = false
}
