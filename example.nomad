job "example" {
  datacenters = ["dc1"]

  group "web" {
    task "nginx" {
      driver = "docker"

      config {
        image = "ghcr.io/simnalamburt/sample-redis-app:1.0.0"
      }
    }

    network {
      mode = "bridge"
      port "http" {
        static = 5000
        to     = 5000
      }
    }

    service {
      name = "web"
      port = "5000"

      connect {
        sidecar_service {
          proxy {
            upstreams {
              destination_name = "cache"
              local_bind_port = 6379
            }
          }
        }
      }
    }
  }

  group "cache" {
    task "redis" {
      driver = "docker"

      config {
        image = "redis:3.2"
      }
    }

    network {
      mode = "bridge"
    }

    service {
      name = "cache"
      port = "6379"

      connect {
        sidecar_service {}
      }
    }
  }
}
