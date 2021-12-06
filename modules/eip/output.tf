output "out_eip_ip" {
  value = aws_eip.annaix_eip.public_ip
}

output "out_eip_id" {
  value = aws_eip.annaix_eip.id
}