resource "volterra_http_loadbalancer" "this" {
  name                            = "${var.name}-http-lb-tf"
  namespace                       = var.namespace
  no_challenge                    = true
  domains                         = ["${var.name}.${var.domainSuffix}"]
  disable_rate_limit              = true
  service_policies_from_namespace = true
  disable_waf                     = true
  advertise_on_public_default_vip = true

  default_route_pools {
    pool {
      name = volterra_origin_pool.this.name
    }
  }

  https_auto_cert {
    http_redirect = true
    add_hsts = false
    port = var.lb_port
    tls_config {
      default_security = true
    }
    no_mtls = true
    default_header = true
    enable_path_normalize = true
    non_default_loadbalancer = true
  }

  more_option {
    request_headers_to_add {
      name = "Original Client IP"
      value = "$[original_client_address]"
      append = false
    }
  }

  app_firewall {
    name      = volterra_app_firewall.this.name
    namespace = var.namespace
  }

  bot_defense {
    policy {
      disable_js_insert = false
      js_insert_all_pages {
        javascript_location  = "After <head> tag"
      }
      protected_app_endpoints {
        http_methods = ["POST"]
        metadata {
          name = "bot-defense"
        }
        mitigation {
          block {
            body = "string:///PHA+VGhpcyBpcyBhIGJvdCBkZWZlbnNlIGJsb2NrIHBhZ2UuPC9wPg=="
            #<p>This is a bot defense block page.</p>"
            status = "BadRequest"
          }
        }
        path {
          prefix = "/"
        }
      }

      js_download_path = "/common.js"
    }
    regional_endpoint = "US"
  }

  labels = {
    created_by_tf = "true"
  }
}