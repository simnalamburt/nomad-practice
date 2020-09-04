job "example" {
  datacenters = ["dc1"]

  group "web" {
    task "nginx" {
      driver = "docker"

      config {
        image = "ghcr.io/simnalamburt/sample-redis-app:1.0.0"

        port_map {
          http = 5000
        }
      }

      resources {
        network {
          port "http" {}
        }
      }

      service {
        port = "http"
      }
    }
  }

  group "cache" {
    task "redis" {
      driver = "docker"

      config {
        image = "redis:3.2"

        port_map {
          db = 6379
        }
      }

      resources {
        network {
          port "db" {}
        }
      }

      service {
        port = "db"
      }
    }
  }
}
