resource "aws_spot_instance_request" "name_2" {
    ami           = "ami-0bb6af715826253bf"
    instance_type = var.instance_type
    spot_type     = "persistent"
    instance_interruption_behavior = "stop"
    wait_for_fulfillment=true
    vpc_security_group_ids = ["sg-036e9bfb37a180657"]
    tags = {
      Name = var.component
    }

    timeouts {
    create = "10m"
    delete = "10m"
  }
provisioner "remote-exec" {
  connection {
    host = aws_spot_instance_request.name_2.public_ip
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

