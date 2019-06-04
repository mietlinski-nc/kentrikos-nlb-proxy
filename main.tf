resource "aws_ecs_service" "haproxy" {
  name            = "${var.aws_ecs_clustername}"
  cluster         = "${aws_ecs_cluster.this.id}"
  task_definition = "${aws_ecs_task_definition.haproxy.arn}"
  desired_count   = "${var.aws_ecs_tasks_number}"
  iam_role        = "${aws_iam_role.this.arn}"
  depends_on      = ["aws_iam_role_policy.This"]

  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }

  load_balancer {
    target_group_arn = "${aws_lb_target_group.this.arn}"
    container_name   = "${var.container_name}"
    container_port   = "${var.container_port}"
  }

  placement_constraints {
    type       = "memberOf"
  }
}

resource "aws_ecs_task_definition" "haproxy" {
  family                = "service"
  container_definitions = "${file("task-definitions/service.json")}"

  volume {
    name      = "service-storage"
    host_path = "/ecs/service-storage"
  }
}

resource "aws_iam_role_policy" "ecs_policy" {
  name = "test_ecs_policy"
  role = "${aws_iam_role.TaskExectionRole.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
      ],
      "Resource": "*"
  }
  ]
}
EOF
}

resource "aws_iam_role" "TaskExectionRole" {
  name = "ecsTaskExectionRole"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Sid": "",
          "Effect": "Allow",
          "Principal": {
              "Service": "ecs-tasks.amazonaws.com"
          },
          "Action": "sts:AssumeRole"
      }
  ]
}
EOF
}
