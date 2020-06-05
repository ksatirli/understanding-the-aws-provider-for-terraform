# Understanding the AWS Provider for Terraform

> Reading material and code examples

## Table of Contents

- [Understanding the AWS Provider for Terraform](#understanding-the-aws-provider-for-terraform)
  - [Table of Contents](#table-of-contents)
  - [Reading material](#reading-material)
    - [HashiCorp Configuration Language](#hashicorp-configuration-language)
    - [Docker Provider for Terraform](#docker-provider-for-terraform)
    - [AWS Provider for Terraform](#aws-provider-for-terraform)
    - [Code Quality](#code-quality)
    - [Visualizing resources](#visualizing-resources)
    - [Importing resources](#importing-resources)
    - [Modules](#modules)
  - [Author Information](#author-information)
  - [License](#license)

## Reading material

This section is a collection of links that will help you make the most of today's session.

### HashiCorp Configuration Language

* repository: [hashicorp/hcl](https://github.com/hashicorp/hcl/tree/hcl2)

## Terraform Basics

* CLI commands [terraform.io/docs/commands/index.html](https://www.terraform.io/docs/commands/index.html)
* variables and type constraints: [terraform.io/docs/configuration/variables.html](https://www.terraform.io/docs/configuration/variables.html#type-constraints)
* variable definition files: [terraform.io/docs/configuration/variables.html](https://www.terraform.io/docs/configuration/variables.html#variable-definitions-tfvars-files)
* information about Terraform State: [terraform.io/docs/state/index.html](https://www.terraform.io/docs/state/index.html)

### Docker Provider for Terraform

* ChangeLog on [GitHub](https://github.com/terraform-providers/terraform-provider-docker/blob/master/CHANGELOG.md)
* documentation:
  * for the provider can be found on [terraform.io/docs/providers/docker](https://www.terraform.io/docs/providers/docker/index.html)
  * for the `docker_image` resource can be found on [terraform.io/docs/providers/docker/r/image.html](https://www.terraform.io/docs/providers/docker/r/image.html)
  * for the `docker_container` resource can be found on [terraform.io/docs/providers/docker/r/container.html](https://www.terraform.io/docs/providers/docker/r/container.html)

### AWS Provider for Terraform

* releases weekly
* ChangeLog on [GitHub](https://github.com/terraform-providers/terraform-provider-aws/blob/master/CHANGELOG.md)
* documentation:
  * for the provider can be found on [terraform.io/docs/providers/aws](https://www.terraform.io/docs/providers/aws/index.html)
  * for the `aws_instance` resource can be found on [terraform.io/docs/providers/aws/r/instance.html](https://www.terraform.io/docs/providers/aws/r/instance.html)
  * for the `aws_ebs_volume` resource can be found on [terraform.io/docs/providers/aws/r/ebs_volume.html](https://www.terraform.io/docs/providers/aws/r/ebs_volume.html)
  * for the `aws_volume_attachment` resource can be found on [terraform.io/docs/providers/aws/r/volume_attachment.html](https://www.terraform.io/docs/providers/aws/r/volume_attachment.html)
* Learn Guide: Build infrastructure [learn.hashicorp.com/terraform/getting-started/build](https://learn.hashicorp.com/terraform/getting-started/build)
* Build your own AMIs with Packer: [packer.io/docs/builders/amazon/](https://www.packer.io/docs/builders/amazon/)

### Code Quality

Before `plan` and `apply`, always clean up your code:

* use [terraform fmt](https://www.terraform.io/docs/commands/fmt.html) to rewrite Terraform configuration files to a canonical format and style.
* use [terraform validate](https://www.terraform.io/docs/commands/validate.html) to validate the configuration syntax and internal consistency
* use [pre-commit](https://pre-commit.com) to run more checks
  * community member [@antonbabenko/](https://github.com/antonbabenko/) built and maintains [pre-commit-terraform](https://github.com/antonbabenko/pre-commit-terraform)

For more advanced use-cases, have a look at [tflint](https://github.com/terraform-linters/tflint). This application can alert you to provider-specific issues such as defining a non-existant `t12.micro` instance type.

### Visualizing resources

Visualize Terraform-managed resources using the `terraform graph` command:

```shell
terraform graph \
  | dot -Tpng > "infrastructure.png"
```

This uses the `dot` library to render the `.digraph` file into a PNG image (`infrastructure.png`).

[blast-radius](https://github.com/28mm/blast-radius) from [Patrick McMurchie](https://github.com/28mm) is another great way of visualizing your resources.

### Importing resources

* use the [terraform import](https://www.terraform.io/docs/import/index.html) command:

Create a resource in your Terraform code:

```hcl
resource "aws_s3_bucket" "hug_demo" {
  bucket = "hug-demo"
}
```

Then run the `terraform import` command:

```shell
terraform import \
    aws_s3_bucket.hug_demo "hug-demo"
```

specify the Terraform-native resource (`aws_s3_bucket.hug_demo`) as well as the provider resource (`hug-demo`)

* use [Terraformer](https://github.com/GoogleCloudPlatform/terraformer) for importing large sets of resources

### Modules

* use modules as building blocks
* module documentation: [terraform.io/docs/configuration/modules.html](https://www.terraform.io/docs/configuration/modules.html)
* module registry: [registry.terraform.io](https://registry.terraform.io)
* Learn Guide: Modules on [learn.hashicorp.com/terraform/modules/modules-overview](https://learn.hashicorp.com/terraform/modules/modules-overview)

## Author Information

This repository is maintained by [Kerim Satirli](https://github.com/ksatirli).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
