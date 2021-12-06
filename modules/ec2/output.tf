#recuperation dans des variables terraform les variable aws
output "out_instance_id" {
  value = aws_instance.annaix-ec2.id
}

output "out_instance_az" {
  value = aws_instance.annaix-ec2.availability_zone
}
