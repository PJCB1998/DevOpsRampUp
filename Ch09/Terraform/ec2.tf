
module "redis_ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.5.0"

  ami           = "ami-0f8e81a3da6e2510a"
  instance_type = "t2.small"
  name          = "redis-ec2-pjc"
  subnet_id     = data.aws_subnet.ramp_up_training_private_1.id
  instance_tags = {
    project    = var.project_name
    responsible = var.responsable_name
  }
  volume_tags = {
    project    = var.project_name
    responsible = var.responsable_name
  }

  vpc_security_group_ids = [aws_security_group.redis.id]

  key_name = aws_key_pair.tf-key-pair.key_name

  user_data = base64encode(local.redis_user_data)

}

module "zipkin_ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.5.0"

  ami           = "ami-0f8e81a3da6e2510a"
  instance_type = "t2.micro"
  name          = "zipkin-ec2-pjc"
  subnet_id     = data.aws_subnet.ramp_up_training_private_1.id
  instance_tags = {
    project    = var.project_name
    responsible = var.responsable_name
  }
  volume_tags = {
    project    = var.project_name
    responsible = var.responsable_name
  }

  vpc_security_group_ids = [aws_security_group.zipkin.id]

  key_name = aws_key_pair.tf-key-pair.key_name

  user_data = base64encode(local.zipkin_user_data)

}


module "lmp_ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.5.0"

  ami           = "ami-0f8e81a3da6e2510a"
  instance_type = "t2.micro"
  name          = "lmp-ec2-pjc"
  subnet_id     = data.aws_subnet.ramp_up_training_private_1.id
  instance_tags = {
    project    = var.project_name
    responsible = var.responsable_name
  }
  volume_tags = {
    project    = var.project_name
    responsible = var.responsable_name
  }

  vpc_security_group_ids = [aws_security_group.lmp.id]

  key_name = aws_key_pair.tf-key-pair.key_name

  user_data = base64encode(local.lmp_user_data)

}
