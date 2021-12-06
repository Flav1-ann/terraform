data "aws_ami" "my_ubuntu_ami" {
  most_recent = true
  owners = ["${var.ubuntu_account_number}"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}

#creation de l'instance ec2
resource "aws_instance" "annaix-ec2" {
  #Les informations de l'instance ec2
  ami             = data.aws_ami.my_ubuntu_ami.id
  instance_type   = var.instance_type
  key_name        = var.ssh_key
  availability_zone = "${var.az}"
  security_groups = ["${var.sg_name}"]
  tags = {
    Name = "${var.author}-ec2-ubuntu-bionic"
  }

  provisioner "local-exec" {
    #permet de mettre dans le fichier infos_ec2.txt l'ip, id, et le az
    command = "echo Ip_public: ${var.public_ip} ; ID: ${aws_instance.annaix-ec2.id} ; AZ: ${aws_instance.annaix-ec2.availability_zone}; >> infos_ec2.txt"
  }
  
  #permet de se connecter en ssh a la machine et d'executé les commandes dans le tableau inline
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = var.user
      private_key = file("${var.path_ssh_key}/${var.ssh_key}.pem")
      host        = self.public_ip
    }   
    inline = [
      "sudo apt update -y",
      "sudo apt install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
  }
}