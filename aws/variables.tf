# Variables

variable "projectPrefix" {
  type        = string
  default     = "demo"
  description = "This value is inserted at the beginning of each AWS object (alpha-numeric, no special character)"
}
variable "awsRegion" {
  description = "aws region"
  type        = string
  default     = "us-west-2"
}
variable "awsAz1" {
  description = "Availability zone, will dynamically choose one if left empty"
  type        = string
  default     = "us-west-2a"
}
variable "awsAz2" {
  description = "Availability zone, will dynamically choose one if left empty"
  type        = string
  default     = "us-west-2b"
}
variable "adminSrcAddr" {
  type        = list(string)
  description = "Allowed Admin source IP prefix"
  default     = [""]
}
variable "vpc_cidr" {
  type        = string
  default     = "10.1.0.0/16"
  description = "CIDR IP Address range of the VPC"
}
variable "mgmt_address_prefixes" {
  type        = list(any)
  default     = ["10.1.1.0/24", "10.1.100.0/24"]
  description = "Management subnet address prefixes"
}
variable "ext_address_prefixes" {
  type        = list(any)
  default     = ["10.1.10.0/24", "10.1.110.0/24"]
  description = "External subnet address prefixes"
}
variable "int_address_prefixes" {
  type        = list(any)
  default     = ["10.1.20.0/24", "10.1.120.0/24"]
  description = "Internal subnet address prefixes"
}
variable "resourceOwner" {
  type        = string
  description = "owner of the deployment, for tagging purposes"
  default     = "myName"
}
variable "ssh_key" {
  type        = string
  description = "key pair name to ssh to instances"
  default     = "russ-malloy-key"
}
variable "user_data_script" {
  type        = string
  description = "script to run on ec2 startup"
  default     = ""
}
variable "xc_public_ips" {
  type = list(string)
  description = "list of public ip's used for F5 Distributed Cloud"
  // https://docs.cloud.f5.com/docs/reference/network-cloud-ref
  default = ["5.182.215.0/25", "84.54.61.0/25", "23.158.32.0/25", "84.54.62.0/25", "185.94.142.0/25", "185.94.143.0/25", "159.60.190.0/24"]
}
 