output "vpc_id"{
    value= aws_vpc.my_vpc.id
}
output "subnet1"{
    value = aws_subnet.my_subnet1.id
}
output "subnet2"{
    value = aws_subnet.my_subnet2.id
}
output "sg1"{
    value = aws_security_group.allow_jenkins.id
}