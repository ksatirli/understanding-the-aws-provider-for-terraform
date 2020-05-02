// apply the `latest` value by running:
// terraform plan -out="docker.tfplan"
// terraform apply "docker.tfplan"
//
// when succesful, experiment by changing
// the value below from "latest" to "linux"
// and then re-apply the changes by running:
//
// terraform plan -out="docker.tfplan"
// terraform apply "docker.tfplan"
// again

image_version = "linux"
