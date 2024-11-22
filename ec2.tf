data "aws_ami" "latest_ubuntu" {
  owners           = ["099720109477"]
  most_recent = true
 
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

resource "aws_instance" "panda" {
  depends_on = [null_resource.download_ssh_key]
  count                  = length(var.availability_zones)
  ami                    = data.aws_ami.latest_ubuntu.image_id
  instance_type          = "t2.micro"
  availability_zone      = var.availability_zones[count.index]
  key_name               = var.aws_key_name
  vpc_security_group_ids = [aws_security_group.sg_pub.id]
  subnet_id = aws_default_subnet.default_az[count.index].id
}