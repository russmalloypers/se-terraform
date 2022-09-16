data "aws_ami" "amazon-linux-2" {
  most_recent = true


  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  count = 2

  name = "russ-se-challenge-${count.index}"

  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"
  key_name      = var.ssh_key
  monitoring    = false

  vpc_security_group_ids = [aws_security_group.external.id]
  subnet_id              = module.vpc.public_subnets[count.index]
  user_data              = var.user_data_script

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
