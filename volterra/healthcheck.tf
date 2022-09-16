resource "volterra_healthcheck" "this" {
  name      = "${var.name}-http-check"
  namespace = var.namespace

  http_health_check {
    use_origin_server_name = true
    path                   = "/"

  }
  healthy_threshold   = 2
  interval            = 10
  timeout             = 1
  unhealthy_threshold = 5
  labels = {
    created_by_tf = "true"
  }
}