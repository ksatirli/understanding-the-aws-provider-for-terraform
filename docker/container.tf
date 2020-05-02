resource "docker_image" "hello-world" {
  name = "hello-world:${var.image_version}"
}

resource "docker_container" "hello-world" {
  name  = "hello-world"
  image = docker_image.hello-world.name
}
