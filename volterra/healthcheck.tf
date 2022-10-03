resource "volterra_healthcheck" "this" {
  name      = "${var.name}-http-check"
  namespace = var.namespace

  http_health_check {
    use_origin_server_name = var.use_origin_server_name
    path                   = var.path
  }
  healthy_threshold   = var.hc_healthy_threshold
  interval            = var.hc_interval
  timeout             = var.hc_timeout
  unhealthy_threshold = var.hc_unhealthy_threshold
  labels = {
    created_by_tf = "true"
  }
}
