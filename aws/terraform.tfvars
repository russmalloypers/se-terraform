projectPrefix         = "Russ_demo"
resourceOwner         = "Russ_Malloy"
awsRegion             = "us-west-1"
awsAz1                = "us-west-1b"
awsAz2                = "us-west-1c"
vpc_cidr              = "10.84.0.0/16"
mgmt_address_prefixes = ["10.84.1.0/24", "10.84.101.0/24"]
ext_address_prefixes  = ["10.84.2.0/24", "10.84.102.0/24"]
int_address_prefixes  = ["10.84.3.0/24", "10.84.103.0/24"]
adminSrcAddr          = ["73.65.136.7/32"]
user_data_script      = <<-EOT
#!/bin/bash
yum update -y
yum install -y docker
service docker start
docker pull bkimminich/juice-shop:v14.1.1
docker run -d -p 80:3000 bkimminich/juice-shop:v14.1.1
EOT
