resource "aws_security_group" "rearc_test" {
  name        = "rearc-test"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress = [
    {
      description  = "TLS from VPC"
      from_port    = 443
      to_port      = 443
      protocol     = "tcp"
      cidr_blocks  = var.cidr_block
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false 
    },
    {
      description  = "ICMP from the internet"  
      from_port    = -1
      to_port      = -1
      protocol     = "icmp"
      cidr_blocks  = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false 
      
  }
  ]

  egress = [
    {
      description      = "egress"  
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false 
    }
  ]

  tags = {
    Name = "rearc-test"
  }
}