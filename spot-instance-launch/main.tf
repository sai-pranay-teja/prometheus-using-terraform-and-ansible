resource "aws_spot_instance_request" "private_instance" {
    ami           = "ami-0bb6af715826253bf"
    instance_type = var.private_instance_type
    spot_type     = "persistent"
    instance_interruption_behavior = "stop"
    wait_for_fulfillment=true
    vpc_security_group_ids = var.security-ID
    subnet_id = [var.private_subnet_id]

    tags = {
      Name = var.private_component
    }

    timeouts {
    create = "10m"
    delete = "10m"
  }
/* provisioner "remote-exec" {
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
  
} */



}

resource "aws_spot_instance_request" "public_instance" {
    ami           = "ami-0bb6af715826253bf"
    instance_type = var.public_instance_type
    spot_type     = "persistent"
    instance_interruption_behavior = "stop"
    wait_for_fulfillment=true
    vpc_security_group_ids = var.security-ID
    subnet_id = [var.public_subnet_id]
    tags = {
      Name = var.public_component
    }

    timeouts {
    create = "10m"
    delete = "10m"
  }
/* provisioner "remote-exec" {
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
  
} */

}


