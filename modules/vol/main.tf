resource "aws_ebs_volume" "my_vol" {
  availability_zone = "${var.az}"
  size              = var.size_vol

  tags = {
    Name = "${var.author}-vol"
  }
}