resource "aws_db_subnet_group" "pg_subnet_group" {
  name = "pg_subnet_group_1"
  subnet_ids = [
    "${aws_subnet.vpc_public_sn_1.id}", "${aws_subnet.vpc_public_sn_2.id}"]
}

resource "aws_db_instance" "pg_db" {
  identifier = "pg"
  allocated_storage = 10
  storage_type = "gp2"
  engine = "postgres"
  engine_version = "9.6"
  instance_class = "db.t2.micro"
  parameter_group_name = "default.postgres9.6"
  skip_final_snapshot = true
  apply_immediately = true
  db_subnet_group_name = "${aws_db_subnet_group.pg_subnet_group.name}"
  vpc_security_group_ids = [
    "${aws_security_group.vpc_public_sg.id}"]
  multi_az = false
  name = "${var.postgres_db_name}"
  username = "${var.postgres_db_username}"
  password = "${var.postgres_db_password}"
}

output "engine" {
  value = "${aws_db_instance.pg_db.engine}"
}

output "engine_version" {
  value = "${aws_db_instance.pg_db.engine_version}"
}

output "endpoint" {
  value = "${aws_db_instance.pg_db.endpoint}"
}

output "port" {
  value = "${aws_db_instance.pg_db.port}"
}

output "db_name" {
  value = "${aws_db_instance.pg_db.name}"
}

output "db_user" {
  value = "${aws_db_instance.pg_db.username}"
}
