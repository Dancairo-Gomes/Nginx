output "instance_ip_addr" {
  value = aws_instance.nginx.public_ip
}
