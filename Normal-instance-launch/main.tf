resource "aws_instance" "demo-instance" {
  ami = "ami-0bb6af715826253bf"
  instance_type = var.type
  vpc_security_group_ids = ["sg-036e9bfb37a180657"]
  iam_instance_profile = var.role_check==true? var.roles:null
  tags = {
    Name = var.name
  }


provisioner "remote-exec" {
  connection {
    host = aws_instance.demo-instance.public_ip
    user = "centos"
    password = "DevOps321"
  }

  inline = [
    "sudo labauto ansible",
    "sudo ansible-galaxy collection install amazon.aws",
    "sudo ansible-pull -i localhost, -U https://github.com/sai-pranay-teja/Ansible-play-pracitise.git roles_playbook.yml -e role_name=ec2_instance"
  ]
  
}
}
