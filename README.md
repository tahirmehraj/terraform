# terraform
1. Clone the repository
2. Add a directory private-key and place your private Key (EC2-Keypair) inside the private-key repository
3. Goto c2-variables.tf, replace the terraform-key with your key name in the following block. For example if your keyname is johndoe.pem , replace the "terraform-key" with "johndoe"
Aws keypair
variable "instance_keypair" {
    description = "Key Pair"
    type = string
    default = "terraform-key"
}
