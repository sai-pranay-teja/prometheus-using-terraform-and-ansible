output "public-spot-id"{
    value = aws_spot_instance_request.public_instance.spot_instance_id
}


output "public-ip"{
    value = aws_spot_instance_request.public_instance.public_ip
}

output "private-spot-id"{
    value = aws_spot_instance_request.private_instance.spot_instance_id
}


output "private-ip"{
    value = aws_spot_instance_request.private_instance.private_ip
}