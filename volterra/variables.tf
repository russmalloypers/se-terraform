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
variable "aks_service" {
  description = "service name in aks"
  type = string
  default = null
}
variable "aks_namespace" {
  description = "namespace in aks"
  type = string
  default = null
}

variable "use_origin_server_name" {
  description = "origin server name"
  type = bool
  default = true
}

variable "path" {
  description = "path to health check"
  type = string
  default = "/"
}

variable "hc_healthy_threshold" {
  description = "description"
  type = number
  default = 3
}
variable "hc_interval" {
  description = "description"
  type = number
  default = 15
}
variable "hc_timeout" {
  description = "description"
  type = number
  default = 5
}
variable "hc_unhealthy_threshold" {
  description = "description"
  type = number
  default = 5
}
variable "no_challenge" {
  description = "description"
  type = bool
  default = true
}
variable "disable_rate_limit" {
  description = "description"
  type = bool
  default = true
}
variable "service_policies_from_namespace" {
  description = "description"
  type = bool
  default = true
}
variable "advertise_on_public_default_vip" {
  description = "description"
  type = bool
  default = true
}
variable "api_p12_file_location" {
  description = "location of p12"
  type = string
  default = "/tmp/f5-amer-ent.console.ves.volterra.io.api-creds.p12"
}
# variable "" {
#   description = "description"
#   type = 
#   default = 
# }
# variable "" {
#   description = "description"
#   type = 
#   default = 
# }
# variable "" {
#   description = "description"
#   type = 
#   default = 
# }
# variable "" {
#   description = "description"
#   type = 
#   default = 
# }
# variable "" {
#   description = "description"
#   type = 
#   default = 
# }
# variable "" {
#   description = "description"
#   type = 
#   default = 
# }
# variable "" {
#   description = "description"
#   type = 
#   default = 
# }