# Terraform Output Values
/*
# EC2 Instance Public IP
output "instance_publicip" {
  description = "EC2 Instance Public IP"
  value = aws_instance.myEc2Vm.public_ip
}

# EC2 Instance Public DNS
output "instance_publicdns" {
  description = "EC2 Instance Public DNS"
  value = aws_instance.myEc2Vm.public_dns
}
*/

output "for_list_output" {
  description = "For loop"
  value =[for instance in aws_instance.myEc2Vm: instance.public_dns ]  
}
output "for_map_output" {
  description = "For loop"
  value = {for c, instance in aws_instance.myEc2Vm: c => instance.public_dns } 
}