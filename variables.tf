#alicloud_arms_alert_contact_group
variable "create" {
  description = "Whether to create resources in module."
  type        = bool
  default     = false
}

variable "alert_contact_group_name" {
  description = "The name of arms contract group."
  type        = string
  default     = null
}

variable "contact_ids" {
  description = "The ids of arms contract."
  type        = list(string)
  default     = []
}

#alicloud_arms_dispatch_rule
variable "create_dispatch_rule" {
  description = "Whether to create arms dispatch rule in module."
  type        = bool
  default     = true
}

variable "dispatch_rule_name" {
  description = "The rule name of dispatch."
  type        = string
  default     = ""
}

variable "dispatch_type" {
  description = "The type of dispatch."
  type        = string
  default     = "CREATE_ALERT"
}

variable "group_wait_time" {
  description = "The waiting time of arms contract group."
  type        = number
  default     = 0
}

variable "group_interval" {
  description = "The interval time of arms contract group."
  type        = number
  default     = 0
}

variable "repeat_interval" {
  description = "The repeat interval time of arms contract group."
  type        = number
  default     = 0
}


variable "grouping_fields" {
  description = "The files of arms contract group."
  type        = list(string)
  default     = []
}

variable "match_expressions" {
  description = "The lable of match expresoins."
  type = list(object({
    key      = string
    value    = string
    operator = string
  }))
  default = []
}

variable "notify_type" {
  description = "The type of the alert contact. Valid values: ARMS_CONTACT: contact. ARMS_CONTACT_GROUP: contact group."
  type        = string
  default     = "ARMS_CONTACT_GROUP"
}

variable "notification_name" {
  description = "The name of arms notification."
  type        = string
  default     = ""
}

variable "notify_channels" {
  description = "The name of arms notification."
  type        = list(string)
  default     = ["dingTalk", "wechat"]
}

variable "notify_start_time" {
  description = "The start time of arms notification."
  type        = string
  default     = null
}
variable "notify_end_time" {
  description = "The end time of arms notification."
  type        = string
  default     = null
}

#alicloud_arms_prometheus_alert_rule
variable "create_prometheus_alert_rule" {
  description = "Whether to create prometheus alert rule."
  type        = bool
  default     = true
}

variable "alert_name" {
  description = "The alert name of prometheus."
  type        = string
  default     = ""
}

variable "cluster_id" {
  description = "The ID of the cluster."
  type        = string
  default     = ""
}

variable "alert_expression" {
  description = "The alert expression of prometheus."
  type        = string
  default     = ""
}

variable "alert_message" {
  description = "The alert message of prometheus."
  type        = string
  default     = ""
}

variable "alert_duration" {
  description = "The duration of the alert."
  type        = string
  default     = "1"
}

variable "alert_notify_type" {
  description = "The notify type of prometheus."
  type        = string
  default     = "DISPATCH_RULE"
}

variable "prometheus_type" {
  description = "The type information of prometheus."
  type        = string
  default     = ""
}
