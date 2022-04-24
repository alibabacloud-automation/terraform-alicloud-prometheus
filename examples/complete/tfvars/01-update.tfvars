#alicloud_arms_alert_contact
alert_contact_name = "update-tf-testacc-user"
email              = "168@aliyun.com"

#alicloud_arms_alert_contact_group
alert_contact_group_name = "update-tf-testacc-group"

#alicloud_arms_dispatch_rule
dispatch_rule_name = "update-tf-testacc-rule"
dispatch_type      = "DISCARD_ALERT"
group_wait_time    = 20
group_interval     = 20
repeat_interval    = 20
grouping_fields    = ["alertname"]
match_expressions = [
  {
    key      = "_aliyun_arms_alert_name",
    value    = "update-tf-testacc-app",
    operator = "eq"
  }
]
notify_type       = "ARMS_CONTACT"
notification_name = "update-tf-testacc-notification"
notify_channels   = ["email"]

#alicloud_arms_prometheus_alert_rule
alert_notify_type = "DISPATCH_RULE"