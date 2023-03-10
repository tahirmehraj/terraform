# terraform
1. Clone the repository
2. Add a directory "private-key" to the root of the repository and place your private Key (EC2-Keypair) inside the private-key directory
3. Goto c2-variables.tf, replace the terraform-key with your key name in the following block. For example if your keyname is johndoe.pem , replace the "terraform-key" with "johndoe"
Aws keypair
variable "instance_keypair" {
    description = "Key Pair"
    type = string
    default = "terraform-key"
}
4. Run terraform init
5. Run terraform plan
6. Run terraform apply
