terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "app_image" {
  name = "test1"
  build {
##need to change this to a variable path
    context = "/home/magallanes/Documentos/Quansight/interview-assignment-infra-laumagallanes/app/"
    dockerfile = "" #/home/magallanes/Documentos/Quansight/interview-assignment-infra-laumagallanes/app/Dockerfile"
  }
}

resource "docker_container" "app_container" {
  name  = "r_app_container"
  image = "test1"
  ports {
    internal = 8000
  }
  volumes {
    host_path      = "/home/magallanes/Documentos/Quansight/interview-assignment-infra-laumagallanes/app/src"
    container_path = "/app"
  }
  depends_on  = [docker_image.app_image]
  network_mode = "bridge"
}

