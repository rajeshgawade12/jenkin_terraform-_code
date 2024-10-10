module "ec2" {
    source = "./ec2"
    subnet1 = module.vpc.subnet1
    sg1 = module.vpc.sg1
}
module "vpc" {
    source = "./vpc"
}
module "route_table" {
    source = "./route_table"
    vpc_id = module.vpc.vpc_id
    subnet1 = module.vpc.subnet1
}