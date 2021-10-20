resource "aws_instance" "test-instance" {
     ami                          = var.ami_name
     instance_type                = var.instance_type
     subnet_id                    = var.subnet_id[0]
     associate_public_ip_address  = var.create_public_ip
     vpc_security_group_ids       = [aws_security_group.rearc_test.id]
     key_name                     = var.key_name
     user_data                    = "install_app.sh"
     tags={
         Name = "rearc-test-instance"
     }

lifecycle {
     ignore_changes = [ami]
     }
 }