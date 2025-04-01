# Recurso RDS Mysql
resource "aws_db_instance" "mydb" {
  identifier = var.identifier
  engine = var.engine
  allocated_storage = var.storage
  engine_version = "${lookup(var.engine_version, var.engine)}"
  instance_class = var.instance_class
  username = var.rds_username
  password = var.rds_passwd
  storage_type = "gp2"
  multi_az = true 
  db_subnet_group_name = var.db_subnet_group_name 
  vpc_security_group_ids = [var.security_group_ids]
  storage_encrypted = true
  skip_final_snapshot = true
}

resource "aws_rds_cluster" "myclusterdb" {
  cluster_identifier      = "aurora-cluster-demo"
  engine                  = "aurora-mysql"
  availability_zones      = ["eu-west-3a", "eu-west-3b", "eu-west-3c"]
  database_name           = "mydb"
  master_username         = "jjavila"
  master_password         = "must_be_eight_characters"
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
}

