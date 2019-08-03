resource "aws_ecs_task_definition" "default" {
  family                   = var.task_difinition_family
  cpu                      = var.cpu
  memory                   = var.memory
  network_mode             = var.network_mode
  requires_compatibilities = var.requires_compatibilities
  container_definitions    = var.container_definitions
  execution_role_arn       = var.execution_role_arn
}
