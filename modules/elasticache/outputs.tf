output "laboon_stage_redis_primary_endpoint_address" {
  value = aws_elasticache_replication_group.default.primary_endpoint_address
}

