resource "aws_instance" "nginx" {
  ami           = var.AMI
  instance_type = "t2.micro"
  key_name = var.KEY_NAME
  vpc_security_group_ids = [aws_security_group.nginx-ssh.id, aws_security_group.nginx-web-http.id, aws_security_group.nginx-web-https.id]
  
    tags = {
    Name = "nginx-server"
    }

  provisioner "file" {
    source      = "Nginx.sh"
    destination = "/tmp/Nginx.sh"

    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = "${file("~/Downloads/monitoramento.pem")}"
      host = "${self.public_ip}"
      timeout = "5m"
      agent = false

    }
  }
    
  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/Nginx.sh",
      "/tmp/Nginx.sh args",
      
    ]
    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = "${file("~/Downloads/monitoramento.pem")}"
      host = "${self.public_ip}"
      timeout = "5m"
      agent = false
    }
  }
  }

 
  





