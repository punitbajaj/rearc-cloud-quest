module "rearc-cloud" {
  source          = "../../modules/rearc-cloud"
  ami_name        = var.ami_name
  cidr_block      = var.cidr_block
  subnet_id       = var.subnet_id
}