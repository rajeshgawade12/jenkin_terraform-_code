module "ec2" {
    source = "./ec2"
    subnet1 = module.vpc.subnet1
    sg1 = module.vpc.sg1
}
module "vpc" {
    source = "./vpc"
}