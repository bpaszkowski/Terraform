resource "aws_default_subnet" "default_az" {
  count            = length(var.availability_zones)
  availability_zone = var.availability_zones[count.index]
}
 
resource "aws_default_vpc" "default" {}