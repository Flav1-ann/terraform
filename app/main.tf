provider "aws" {
  region     = "us-east-1"
  shared_credentials_file = "C:/Users/33664/Desktop/Ensup/M2/terraform/Tp2/credentials"
}

#Appel du module de création du sg
module "sg" {
  source = "../modules/sg"
  author = "flavien"
}

#Appel module de création du volume
module "vol" {
  source  = "../modules/vol"
  size_vol = 8
  author = "flavien"
}

# Appel du module de création de l'adresse ip pulique
module "eip" {
  source        = "../modules/eip"
}

# Appel du module de création de ec2
module "ec2" {
  source        = "../modules/ec2"
  author        = "flavien"
  instance_type = "t2.micro"
  sg_name= "${module.sg.out_sg_name}"
  public_ip = "${module.eip.out_eip_ip}"
  user = "ubuntu"
}

#Creation des associations nécessaires entre nos ressources
resource "aws_eip_association" "eip_assoc" {
  instance_id = module.ec2.out_instance_id
  allocation_id = module.eip.out_eip_id
}

resource "aws_volume_attachment" "vol_att" {
  device_name = "/dev/sdh"
  volume_id   = module.vol.out_vol_id
  instance_id = module.ec2.out_instance_id
}
