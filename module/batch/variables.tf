variable "compute_envs" {
  type = map(object({
    name           = string
    type           = string
    instance_type  = list(string),
    allocation_strategy = string
  }))
}
