provider "docker" {
  version = "~> 2.7"
  host    = "unix:///var/run/docker.sock"

  //  registry_auth {
  //    address     = "registry.hub.docker.com"
  //    config_file = "${pathexpand("~/.docker/config.json")}"
  //  }
}
