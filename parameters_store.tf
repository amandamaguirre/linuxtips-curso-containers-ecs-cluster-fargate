resource "aws_ssm_parameter" "lb_arn" {
  name  = format("/%s/ecs/lb/id", var.project_name)
  type  = "String"
  value = aws_lb.main.id
}

resource "aws_ssm_parameter" "lb_listener" {
  name  = format("/%s/ecs/lb/listener", var.project_name)
  type  = "String"
  value = aws_lb_listener.main.arn
}

resource "aws_ssm_parameter" "lb_internal_arn" {
  name  = format("/%s/ecs/lb/internal/id", var.project_name)
  type  = "String"
  value = aws_lb.internal.id
}

resource "aws_ssm_parameter" "lb_internal_listener" {
  name  = format("/%s/ecs/lb/internal/listener", var.project_name)
  type  = "String"
  value = aws_lb_listener.internal.arn
}

resource "aws_ssm_parameter" "cloudmap" {
  name  = "/linuxtips/ecs/cloudmap/namespace"
  value = aws_service_discovery_private_dns_namespace.main.id
  type  = "String"
}
