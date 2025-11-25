module "aws_vpc_k3s" {
  source = "github.com/aumthakkar/aws-vpc-with-k3s-nov-25.git"

  vpc_cidr    = "10.0.0.0/16"
  name_prefix = "pht-dev"

  public_subnet_count = 2

  auto_create_public_subnets = true
  public_subnet_cidr_block   = ["10.22.0.24/24", "10.24.0.24/24"]

  ssh_access_ip = "0.0.0.0/0"


  lb_tg_port     = 8000
  lb_tg_protocol = "HTTP"

  lb_healthy_threshold   = 3
  lb_unhealthy_threshold = 3
  lb_interval            = 30
  lb_timeout             = 5

  lb_listener_port     = 80
  lb_listener_protocol = "HTTP"


  db_storage = 10
  db_name    = "rancher"

  db_identifier     = "pht-db"
  db_instance_class = "db.t3.micro"

  db_username = "pranav"
  db_password = "t4b!2025"


  db_engine         = "mysql"
  db_engine_version = "8.0.39"

  skip_db_final_snapshot = true


  k3s_instance_count = 1
  public_key_path    = "../aws-tf/mtckey.pub"

  ec2_instance_type = "t3.micro"
  key_name          = "mtckey"

  k3s_instance_vol_size = 10

}