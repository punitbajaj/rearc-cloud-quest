variable "cidr_block" {
    description = "vpc cidr block"
}

variable "vpc_id" {
    description = "vpc id"
    default = "vpc-ddd0a6b6"
  
}
variable "ami_name" {
    description = "Name of the ami to be used for creating instance"
    type = string
}

variable "instance_type" {
    description = "Size of instance to be used"
    type = string
    default = "t2.micro"
}

variable "subnet_id" {
    description = "subnet in which the instance will be created"
}

variable "create_public_ip" {
    description = "If we need a public ip associated with the instance"
    type = bool
    default = true
}

variable "key_name" {
    description = "key name to be used to create the instance"
    type = string  
    default = "punit"
}

