resource "aws_ec2_tag" "spot_instance_tag_public" {
    
    resource_id = var.public-spot-id
    key         = var.public_key
    value       = var.public_component
}

resource "aws_ec2_tag" "spot_instance_tag_private" {
    
    resource_id = var.private-spot-id
    key         = var.private_key
    value       = var.private_component
}



