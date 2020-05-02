resource "aws_instance" "hug_demo" {
  ami               = var.ami_id
  instance_type     = var.instance_type
  availability_zone = var.availability_zone

  tags = {
    Name = "Terraform-managed EBS Volume for HUG Demo"
  }
}

resource "aws_ebs_volume" "hug_demo" {
  availability_zone = var.availability_zone
  size              = 100
  type              = "io1"
  iops              = 1000

  tags = {
    Name = "Terraform-managed EBS Volume for HUG Demo"
  }
}

// uncomment the `aws_volume_attachment` resources
// to understand how it interacts with the previously
// created `aws_instance` resource
//resource "aws_volume_attachment" "hug_demo" {
//  device_name = "/dev/sdh"
//  volume_id   = aws_ebs_volume.hug_demo.id
//  instance_id = aws_instance.hug_demo.id
//}
