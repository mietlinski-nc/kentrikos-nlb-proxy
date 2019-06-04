output "ECS_cluster_name" {
  description = "Name of ECS cluster"
  value       = "${aws_ecs_service.haproxy.Name}"
}