output "from_module_compute" {
  value = "${module.batch.compute}"
}
output "from_module_compute_spot" {
  value = "${module.batch.compute.spot.arn}"
}
output "from_module_compute_serverless" {
  value = "${module.batch.compute.fargate.arn}"
}
output "from_module_compute_on_demand" {
  value = "${module.batch.compute.ec2.arn}"
}