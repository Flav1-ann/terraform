#les variables utilisé ou utile pour la main
variable "author" {
  type    = string
  default = "annaix"
}

variable "instance_type" {
  type    = string
  default = "t2.nano"
}

variable "ssh_key" {
  type    = string
  default = "flavien-kp"
}

variable "path_ssh_key" {
  type    = string
  default = "C:/Users/33664/Desktop/Ensup/M2/terraform"
}
variable "ubuntu_account_number" {
  default = "099720109477"
}

variable "az" {
  type    = string
  default = "us-east-1b"
}

variable "user" {
  type    = string
  default = "ec2-user"
}
variable "sg_name" {  
  type    = string
  default = "NULL"
}

variable "public_ip" {
  type    = string
  default = "NULL"
}

