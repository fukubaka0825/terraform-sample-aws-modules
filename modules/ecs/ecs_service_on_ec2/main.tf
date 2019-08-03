resource "aws_ecs_service" "default" {
  name                              = var.service_name
  cluster                           = var.cluster_arn
  task_definition                   = var.task_definition
  desired_count                     = var.desired_count
  launch_type                       = "EC2"
  health_check_grace_period_seconds = var.health_check_grace_period_seconds

  dynamic load_balancer {
    //is_load_balancer_modeがfalseならこのargument設定されない
    for_each = var.has_load_balancer ? {dummy ="hoge"} :{}
    content {
      target_group_arn = var.target_group_arn
      container_name   = var.container_name
      container_port   = var.container_port
    }
  }

  lifecycle {
    ignore_changes = [task_definition]
  }
}

resource "aws_appautoscaling_target" "ecs_target" {
  max_capacity       = var.max_capacity
  min_capacity       = var.min_capacity
  resource_id        = "service/${var.cluster_name}/${aws_ecs_service.default.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}
