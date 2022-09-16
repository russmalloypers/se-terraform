data "aws_instance" "one" {
  filter {
    name   = "tag:Name"
    values = ["russ-se-challenge-0"]
  }
}

data "aws_instance" "two" {
  filter {
    name   = "tag:Name"
    values = ["russ-se-challenge-1"]
  }
}
