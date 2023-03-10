#Create ec2 instance
resource "aws_instance" "myEc2Vm" {
    ami = "ami-0b5eea76982371e91"
    #instance_type = var.instance_type
    #instance_type = var.instance_type_list[0] For list!
    instance_type = var.intance_type_map["dev"]
    user_data = file("${path.module}/app1-install.sh")
    key_name = var.instance_keypair
    vpc_security_group_ids = [aws_security_group.vpc-ssh.id,aws_security_group.vpc-web.id ]
    count = 1
}