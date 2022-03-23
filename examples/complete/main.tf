resource "alicloud_arms_alert_contact" "default" {
  alert_contact_name = "example_value"
  email              = "example_value@aaa.com"
}

data "alicloud_cs_managed_kubernetes_clusters" "default" {
  name_regex = "tf_Acc"
}

module "example" {
  source                   = "../.."
  create                   = true
  alert_name               = "tf_prometheus_alert_name"
  alert_expression         = "node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes * 100 < 10"
  alert_message            = "node available memory is less than 10%"
  prometheus_type          = "Kubernetes component alert"
  alert_contact_group_name = "tf-arms-contract-group-name"
  dispatch_rule_name       = "tf-dispatch-rule-name"
  group_wait_time          = 5
  group_interval           = 15
  repeat_interval          = 100
  notification_name        = "tf-arms-notification"
  contact_ids              = [alicloud_arms_alert_contact.default.id]
  cluster_id               = data.alicloud_cs_managed_kubernetes_clusters.default.id
  match_expressions        = [{ key = "aliyun_arms_involvedObject_kind", value = "app", operator = "eq" }]
}