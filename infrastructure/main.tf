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
    context = "/home/magallanes/Documentos/Quansight/resolucion/app/" #change tha path to the location of your repository
    dockerfile = ""
  }
}

resource "docker_container" "app_container" {
  name  = "r_app_container"
  image = "test1"
  ports {
    internal = 8000
  }
  volumes {
    host_path      = "/home/magallanes/Documentos/Quansight/resolucion/app/src" #same here
    container_path = "/app"
  }
  depends_on  = [docker_image.app_image]
  network_mode = "bridge"
}

resource "docker_image" "nginx_image" {
  name = "nginxq1"
build {
     context =  "/home/magallanes/Documentos/Quansight/resolucion/nginx/"
dockerfile = ""
      }
}

resource "docker_container" "nginx_container" {
  name  = "nginx_container"
  image = "nginxq1"
  ports {
    external = 80 
    internal = 80
 } 
  ports {
    external = 443
    internal = 443 
  }

depends_on  = [docker_image.nginx_image, docker_container.app_container]
  network_mode = "bridge"
}


