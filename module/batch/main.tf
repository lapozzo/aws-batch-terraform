provider "aws" {
  region = "us-east-1"
}

resource "aws_batch_compute_environment" "sample" {
  lifecycle {
    create_before_destroy = true
  }
  for_each = var.compute_envs
  compute_environment_name_prefix = each.value.name

  compute_resources {
    instance_role = each.value.name == "serverless" ? null : aws_iam_instance_profile.ecs_instance_role.arn
    spot_iam_fleet_role = each.value.name == "spot" ? aws_iam_instance_profile.ecs_instance_role.arn : null
    allocation_strategy = each.value.allocation_strategy
    instance_type = each.value.instance_type

    max_vcpus = 2
    min_vcpus = 0

    security_group_ids = [
      aws_security_group.sample.id,
    ]

    subnets = [
      aws_subnet.sample.id,
    ]

    type = each.value.type
  }

  service_role = aws_iam_role.aws_batch_service_role.arn
  type         = "MANAGED"
  depends_on   = [aws_iam_role_policy_attachment.aws_batch_service_role]
}