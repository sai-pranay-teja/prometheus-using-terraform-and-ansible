resource "aws_ec2_tag" "spot_instance_tag_1" {
    
    resource_id = var.spot-id
    key         = var.key
    value       = var.component
}


