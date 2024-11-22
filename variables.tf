variable "availability_zones" {
  type = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "aws_key_name" {
type = string
description= "Nazwa klucza dodanego w AWS"
}