output "vpc_id"{
    value= module.vpc.vpc_id
}
output "subnet1"{
    value= module.vpc.subnet1
}
output "subnet2"{
    value= module.vpc.subnet2
}
output "sg1" {
    value= module.vpc.sg1
}