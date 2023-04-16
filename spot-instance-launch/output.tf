output "spot-id"{
    value = aws_spot_instance_request.name_2.spot_instance_id
}


output "public-ip"{
    value = aws_spot_instance_request.name_2.public_ip
}