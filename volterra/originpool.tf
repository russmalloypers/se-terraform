resource "volterra_origin_pool" "this" {
  name                   = "${var.name}-origin-tf"
  namespace              = var.namespace
  endpoint_selection     = "distributed"
  loadbalancer_algorithm = "round_robin"
  description = "${var.name} origin pool deployed with terraform"

  origin_servers {
    public_ip {
      ip = data.aws_instance.one.public_ip
    }
    labels = {
      az = data.aws_instance.one.availability_zone
      created_by_tf = "true"
    }
  }

  origin_servers {
    public_ip {
      ip = data.aws_instance.two.public_ip
    }
    labels = {
      az = data.aws_instance.two.availability_zone
      created_by_tf = "true"
    }
  }

  healthcheck {
    name = volterra_healthcheck.this.name  
  }

  port = var.origin_server_port
  no_tls = true
  labels = {
    created_by_tf = "true"
  }
}
