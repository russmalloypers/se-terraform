resource "volterra_http_loadbalancer" "this" {
  name                            = "${var.name}-http-lb-tf"
  namespace                       = var.namespace
  no_challenge                    = var.no_challenge
  domains                         = ["${var.name}.${var.domainSuffix}"]
  disable_rate_limit              = var.disable_rate_limit
  service_policies_from_namespace = var.service_policies_from_namespace
  advertise_on_public_default_vip = var.advertise_on_public_default_vip
  #git

  default_route_pools {
    pool {
      name = volterra_origin_pool.this.name
    }
  }

  #git

  http {
    dns_volterra_managed = true
    port                 = "80"
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
          flag {
            #body = "string:///PHA+VGhpcyBpcyBhIGJvdCBkZWZlbnNlIGJsb2NrIHBhZ2UuPC9wPg=="
            #<p>This is a bot defense block page.</p>"
            #status = "BadRequest"
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