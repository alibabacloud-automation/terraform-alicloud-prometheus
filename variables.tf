variable "alert_name" {
  description = "The alert name of prometheus."
  type        = string
  default     = null
}

variable "cluster_id" {
  description = "The ID of the cluster.."
  type        = string
}

variable "alert_expression" {
  description = "The alert expression of prometheus."
  type        = string
  default     = null
}

variable "alert_message" {
  description = "The alert message of prometheus."
  type        = string
  default     = null
}

variable "alert_notify_type" {
  description = "The notify type of prometheus."
  type        = string
  default     = "DISPATCH_RULE"
}

variable "prometheus_type" {
  description = "The type information of prometheus."
  type        = string
  default     = null
}

variable "alert_contact_group_name" {
  description = "The name of arms contract group."
  type        = string
  default     = null
}

variable "contact_ids" {
  description = "The ids of arms contract."
  type        = list(string)
}

variable "dispatch_rule_name" {
  description = "The rule name of dispatch."
  type        = string
  default     = null
}

variable "dispatch_type" {
  description = "The type of dispatch."
  type        = string
  default     = "CREATE_ALERT"
}

variable "group_wait_time" {
  description = "The waiting time of arms contract group."
  type        = number
  default     = null
}

variable "group_interval" {
  description = "The interval time of arms contract group."
  type        = number
  default     = null
}


variable "repeat_interval" {
  description = "The repeat interval time of arms contract group."
  type        = number
  default     = null
}


variable "grouping_fields" {
  description = "The files of arms contract group."
  type        = list(string)
  default     = ["alertname"]
}

variable "match_expressions" {
  type = list(object({
    key      = string
    value    = string
    operator = string
  }))
  description = "The lable of match expresoins."
}

variable "notification_name" {
  description = "The name of arms notification."
  type        = string
  default     = null
}


variable "notify_channels" {
  description = "The name of arms notification."
  type        = list(string)
  default     = ["dingTalk", "wechat"]
}

variable "create" {
  description = "Whether to create resources in module."
  type        = bool
  default     = false
}
