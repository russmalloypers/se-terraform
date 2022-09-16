variable "namespace" {
  type        = string
  description = "namespace to add resources to"
  default     = ""
}
variable "name" {
  type        = string
  description = "name of the project"
  default     = ""
}
variable "lb_port" {
  type        = number
  description = "Load Balancer exposted port"
  default     = null
}
variable "origin_server_port" {
  type        = number
  description = "Port to connect to origin servers"
  default     = null
}
variable "awsRegion" {
  description = "aws region"
  type        = string
  default     = "us-west-1"
}
variable "domainSuffix" {
  description = "volterra managed domain suffix"
  type        = string
  default     = "amer-ent.f5demos.com"
}