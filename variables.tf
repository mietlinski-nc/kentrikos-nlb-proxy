variable "aws_ecs_clustername" {
  description = "The identifier of the ECS Fargate cluster"
  default = "haproxy-cluster"
}

variable "aws_ecs_tasks_number" {
  description = "Number of the tasks to be run on cluster"
  default = 3
}

variable "container_name" {
  description = " The name of the container to associate with the load balancer"
  default = "haproxy"
}

variable "container_port" {
  description = "The port on the container to associate with the load balancer"
  default = 8080
}

variable "common_tag" {
  type        = "map"
  description = "Tags to be assigned to each resource (that supports tagging) created by this module"
}