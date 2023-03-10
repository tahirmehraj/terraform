#Input variables
# Aws region
variable "aws_region" {
    description = "AWS region"
    type = string
    default = "us-east-1"
}

# Instance Type
variable "instance_type" {
    description = "Instance Type"
    type = string
    default = "t3.micro"
}

# Aws keypair
variable "instance_keypair" {
    description = "Key Pair"
    type = string
    default = "terraform-key"
  
}

# Aws Instance type list
variable "instance_type_list" {
    description = "List of instances"
    type = list(string)
    default = [ "t3.mirco", "t3.small" ]

}
variable "intance_type_map" {
    description = "Ec2 instance type"
    type = map(string)
    default = {
      "dev" = "t3.micro"
      "qa" =  "t3.small" 
      "prod" = "t3.large"   
    }
    
}
