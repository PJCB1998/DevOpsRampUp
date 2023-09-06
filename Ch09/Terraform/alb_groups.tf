resource "aws_lb_target_group" "auth_api" {

  name = "auth-api-target-group-pjc"

  vpc_id = data.aws_vpc.ramp_up_training.id

  port = 8000
  protocol = "HTTP"

  tags = {
    project    = var.project_name
    responsible = var.responsable_name
  }

}



resource "aws_lb_target_group" "lmp" {

  name = "lmp-target-group-pjc"

  vpc_id = data.aws_vpc.ramp_up_training.id

  port = 22 
  protocol = "HTTP"

  tags = {
    project    = var.project_name
    responsible = var.responsable_name
  }


}

resource "aws_lb_target_group_attachment" "lmp" {

  target_group_arn = aws_lb_target_group.lmp.arn

  target_id = module.lmp_ec2.id


}




resource "aws_lb_target_group" "frontend" {

  name = "frontend-target-group-pjc"

  vpc_id = data.aws_vpc.ramp_up_training.id

  port = 8080
  protocol = "HTTP"

  tags = {
    project    = var.project_name
    responsible = var.responsable_name
  }


}


resource "aws_lb_target_group" "redis" {

  name = "redis-target-group-pjc"

  vpc_id = data.aws_vpc.ramp_up_training.id

  port = 6379
  protocol = "HTTP"

  tags = {
    project    = var.project_name
    responsible = var.responsable_name
  }


}

resource "aws_lb_target_group_attachment" "redis" {

  target_group_arn = aws_lb_target_group.redis.arn

  target_id = module.redis_ec2.id

}


resource "aws_lb_target_group" "todos_api" {

  name = "todos-api-target-group-pjc"

  vpc_id = data.aws_vpc.ramp_up_training.id

  port = 8082
  protocol = "HTTP"

  tags = {
    project    = var.project_name
    responsible = var.responsable_name
  }


}




resource "aws_lb_target_group" "users_api" {

  name = "users-api-target-group-pjc"

  vpc_id = data.aws_vpc.ramp_up_training.id

  port = 8083
  protocol = "HTTP"

  tags = {
    project    = var.project_name
    responsible = var.responsable_name
  }


}




resource "aws_lb_target_group" "zipkin" {

  name = "zipkin-target-group-pjc"

  vpc_id = data.aws_vpc.ramp_up_training.id

  port = 9411
  protocol = "HTTP"

  tags = {
    project    = var.project_name
    responsible = var.responsable_name
  }

}

resource "aws_lb_target_group_attachment" "zipkin" {

  target_group_arn = aws_lb_target_group.zipkin.arn

  target_id = module.zipkin_ec2.id

}

