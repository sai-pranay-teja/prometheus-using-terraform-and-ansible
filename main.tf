provider "aws" {
    region="us-east-1"
  
}



/* module "role-attachment"{
  

  source = "./role-attachment"
  
}

module "normal-instance-launch"{
  count=var.role["spot"]==true?0:1
  source="./Normal-instance-launch"
  type=var.role["type"]
  name=var.role["name"]
  role_check=var.role["role_assigning"]
  roles=module.role-attachment.roles
}

module "spot-instances"{
  for_each=var.ansible-practise
  instance_type=each.value["type"]
  component=each.value["name"]
  source = "./spot-instance-launch"
  
}


module "tags-for-spot-instances" {
  for_each = var.ansible-practise
  source = "./tags-for-spot-instance"
  key=each.value["key"]
  component=each.value["name"]
  spot-id=module.spot-instances[each.key].spot-id
}

output "public" {
  value=module.normal-instance-launch
  
} */


  
module "module-vpc" {
  env=var.env
  tags=var.tags
  for_each = var.vpc-practise
  source = "git::https://github.com/sai-pranay-teja/module-vpc.git"
  vpc_cidr=each.value["vpc_cidr"]
  public_subnets=each.value["public_subnets"]
  private_subnets=each.value["private_subnets"]

}


