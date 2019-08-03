/* elacticache */
resource "aws_elasticache_replication_group" "default" {
  replication_group_id          = var.replication_group_id
  replication_group_description = var.replication_group_description
  engine                        = var.engine
  engine_version                = var.engine_version
  number_cache_clusters         = var.number_cache_clusters
  node_type                     = var.node_type
  snapshot_window               = var.snapshot_window
  snapshot_retention_limit      = var.snapshot_retention_limit
  maintenance_window            = var.maintenance_window
  automatic_failover_enabled    = var.automatic_failover_enabled
  port                          = var.port
  apply_immediately             = var.apply_immediately
  security_group_ids            = var.security_group_ids
  parameter_group_name          = aws_elasticache_parameter_group.default.name
  subnet_group_name             = aws_elasticache_subnet_group.default.name

  #重要なリソースは必ずこいつを
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_elasticache_parameter_group" "default" {
  name   = var.parameter_group_name
  family = var.parameter_group_family


  dynamic "parameter" {
    for_each = var.parameter
    content {
      name  = parameter.key
      value = parameter.value
    }
  }
}

resource "aws_elasticache_subnet_group" "default" {
  name       = var.subnet_group_name
  subnet_ids = var.subnet_ids
}

