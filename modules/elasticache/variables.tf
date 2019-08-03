/* required */
variable "replication_group_id" {
}

variable "replication_group_description" {
}

variable "engine" {
}

variable "engine_version" {
}

variable "automatic_failover_enabled" {
}

variable "parameter_group_name" {
}

variable "parameter_group_family" {
}

variable "subnet_group_name" {
}

variable "security_group_ids" {
}

variable "subnet_ids" {
}

/* optional */
variable "number_cache_clusters" {
  default = 2
}

variable "node_type" {
  default = "cache.r5.large"
}

variable "snapshot_window" {
  default = "09:10-10:10"
}

variable "snapshot_retention_limit" {
  default = 7
}

variable "maintenance_window" {
  default = "mon:10:40-mon:11:40"
}

variable "port" {
  default = 6379
}

variable "apply_immediately" {
  default = true
}

variable "parameter" {
  type = map(string)
  default = {
    cluster-enabled = "no"
  }
}

