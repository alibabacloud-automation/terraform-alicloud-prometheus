resource "alicloud_arms_alert_contact_group" "arms_alert_contact_group" {
  count                    = var.create ? 1 : 0
  alert_contact_group_name = var.alert_contact_group_name
  contact_ids              = var.contact_ids
}

resource "alicloud_arms_dispatch_rule" "arms_dispatch_rule" {
  count              = var.create ? 1 : 0
  dispatch_rule_name = var.dispatch_rule_name
  dispatch_type      = var.dispatch_type
  group_rules {
    group_wait_time = var.group_wait_time
    group_interval  = var.group_interval
    repeat_interval = var.repeat_interval
    grouping_fields = var.grouping_fields
  }
  label_match_expression_grid {
    label_match_expression_groups {
      dynamic "label_match_expressions" {
        for_each = var.match_expressions
        content {
          key      = label_match_expressions.value["key"]
          value    = label_match_expressions.value["value"]
          operator = label_match_expressions.value["operator"]
        }
      }
    }
  }
  notify_rules {
    notify_objects {
      notify_object_id = alicloud_arms_alert_contact_group.arms_alert_contact_group.0.id
      notify_type      = var.notify_type
      name             = var.notification_name
    }
    notify_channels = var.notify_channels
  }
}

resource "alicloud_arms_prometheus_alert_rule" "arms_prometheus_alert_rule" {
  count                      = var.create ? 1 : 0
  prometheus_alert_rule_name = var.alert_name
  cluster_id                 = var.cluster_id
  expression                 = var.alert_expression
  message                    = var.alert_message
  duration                   = var.alert_duration
  notify_type                = var.alert_notify_type
  dispatch_rule_id           = alicloud_arms_dispatch_rule.arms_dispatch_rule.0.id
  type                       = var.prometheus_type
}