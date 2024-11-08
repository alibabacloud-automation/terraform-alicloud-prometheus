output "this_prometheus_alert_rule" {
  description = "The alert rule ID of prometheus."
  value       = concat(alicloud_arms_prometheus_alert_rule.arms_prometheus_alert_rule[*].id, [""])[0]
}