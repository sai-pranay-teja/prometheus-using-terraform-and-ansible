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
} */




  


  
module "module-vpc" {
  env=var.env
  tags=var.tags
  for_each = var.vpc-practise
  source = "git::https://github.com/sai-pranay-teja/module-vpc.git"
  vpc_cidr=each.value["vpc_cidr"]
  /* main-vpc=each.value["main-vpc"] */
  public_subnets=each.value["public_subnets"]
  private_subnets=each.value["private_subnets"]

}


module "spot-instances"{
  /* depends_on = [module.module-vpc] */
  for_each = var.vpc-practise
  public_instance_type=each.value["public_subnets"].type
  private_instance_type=each.value["private_subnets"].type
  private_component=each.value["private_subnets"].instance_name
  public_component=each.value["public_subnets"].instance_name
  source = "./spot-instance-launch"
  security-ID=module.module-vpc.security-ID
  public_subnet_id=module.module-vpc.public_subnet_id
  private_subnet_id=module.module-vpc.private_subnet_id

  
  
}


module "tags-for-spot-instances" {
  for_each = var.vpc-practise
  source = "./tags-for-spot-instance"
  public_key=each.value["public_subnets"].key
  private_key=each.value["private_subnets"].key
  private_component=each.value["private_subnets"].instance_name
  public_component=each.value["public_subnets"].instance_name
  public-spot-id=module.spot-instances[each.key].public-spot-id
  private-spot-id=module.spot-instances[each.key].private-spot-id
}


output "ip" {
  value = module.spot-instances
  
}