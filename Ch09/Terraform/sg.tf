resource "aws_security_group" "alb" {

  name = "alb-security-group-pjc"

  tags = {
    project     = var.project_name
    responsible = var.responsable_name
  }


  vpc_id = data.aws_vpc.ramp_up_training.id

}

resource "aws_security_group_rule" "http_to_alb" {

  type              = "ingress"
  protocol          = "TCP"
  from_port         = 80
  to_port           = 80
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb.id

}

resource "aws_security_group_rule" "https_to_alb" {

  type              = "ingress"
  protocol          = "TCP"
  from_port         = 443
  to_port           = 443
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb.id
}

resource "aws_security_group_rule" "alb_to_all" {

  type              = "egress"
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb.id

}


resource "aws_security_group_rule" "all_vpc_to_alb" {

  type              = "ingress"
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  cidr_blocks       = [data.aws_vpc.ramp_up_training.cidr_block]
  security_group_id = aws_security_group.alb.id

}


resource "aws_security_group_rule" "all_8000_to_alb" {

  type              = "ingress"
  protocol          = "TCP"
  from_port         = 8000
  to_port           = 8000
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb.id

}

resource "aws_security_group_rule" "all_8083_and_8083_to_alb" {

  type              = "ingress"
  protocol          = "TCP"
  from_port         = 8082
  to_port           = 8083
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb.id

}


resource "aws_security_group_rule" "frontend_to_alb" {

  type                     = "ingress"
  protocol                 = "TCP"
  from_port                = 8080
  to_port                  = 8080
  security_group_id        = aws_security_group.alb.id
  source_security_group_id = aws_security_group.frontend.id



}

resource "aws_security_group_rule" "auth_api_through_alb_to_frontend" {

  type                     = "ingress"
  protocol                 = "TCP"
  from_port                = 8000
  to_port                  = 8000
  security_group_id        = aws_security_group.alb.id
  source_security_group_id = aws_security_group.frontend.id


}

resource "aws_security_group_rule" "users_api_through_alb_to_auth_api" {

  type                     = "ingress"
  protocol                 = "TCP"
  from_port                = 8083
  to_port                  = 8083
  security_group_id        = aws_security_group.alb.id
  source_security_group_id = aws_security_group.auth_api.id


}

resource "aws_security_group_rule" "todos_api_through_alb_to_frontend" {

  type                     = "ingress"
  protocol                 = "TCP"
  from_port                = 8082
  to_port                  = 8082
  security_group_id        = aws_security_group.alb.id
  source_security_group_id = aws_security_group.frontend.id


}

resource "aws_security_group_rule" "redis_through_alb_to_todos_api" {

  type                     = "ingress"
  protocol                 = "TCP"
  from_port                = 6379
  to_port                  = 6379
  security_group_id        = aws_security_group.alb.id
  source_security_group_id = aws_security_group.todos_api.id


}

resource "aws_security_group_rule" "redis_through_alb_lmp" {

  type                     = "ingress"
  protocol                 = "TCP"
  from_port                = 6379
  to_port                  = 6379
  security_group_id        = aws_security_group.alb.id
  source_security_group_id = aws_security_group.lmp.id


}

resource "aws_security_group_rule" "zipkin_through_alb_frontend" {

  type                     = "ingress"
  protocol                 = "TCP"
  from_port                = 9411
  to_port                  = 9411
  security_group_id        = aws_security_group.alb.id
  source_security_group_id = aws_security_group.frontend.id


}

resource "aws_security_group_rule" "zipkin_through_alb_auth_api" {

  type                     = "ingress"
  protocol                 = "TCP"
  from_port                = 9411
  to_port                  = 9411
  security_group_id        = aws_security_group.alb.id
  source_security_group_id = aws_security_group.auth_api.id


}

resource "aws_security_group_rule" "zipkin_through_alb_todos_api" {

  type                     = "ingress"
  protocol                 = "TCP"
  from_port                = 9411
  to_port                  = 9411
  security_group_id        = aws_security_group.alb.id
  source_security_group_id = aws_security_group.todos_api.id


}

resource "aws_security_group_rule" "zipkin_through_alb_users_api" {

  type                     = "ingress"
  protocol                 = "TCP"
  from_port                = 9411
  to_port                  = 9411
  security_group_id        = aws_security_group.alb.id
  source_security_group_id = aws_security_group.users_api.id


}

resource "aws_security_group_rule" "zipkin_through_alb_lmp" {

  type                     = "ingress"
  protocol                 = "TCP"
  from_port                = 9411
  to_port                  = 9411
  security_group_id        = aws_security_group.alb.id
  source_security_group_id = aws_security_group.lmp.id


}

resource "aws_security_group_rule" "zipkin_through_alb_bastion" {

  type                     = "ingress"
  protocol                 = "TCP"
  from_port                = 9411
  to_port                  = 9411
  security_group_id        = aws_security_group.alb.id
  source_security_group_id = aws_security_group.bastion.id


}

resource "aws_security_group" "redis" {
  name        = "redis-security-group-pjc"
  description = "Security group for the redis server"

  vpc_id = data.aws_vpc.ramp_up_training.id

  tags = {
    project     = var.project_name
    responsible = var.responsable_name
  }

  ingress {
    protocol        = "TCP"
    from_port       = 6379
    to_port         = 6379
    security_groups = [aws_security_group.alb.id]
  }

  ingress {
    protocol        = "TCP"
    from_port       = 22
    to_port         = 22
    security_groups = [aws_security_group.bastion.id]
  }

  ingress {
    protocol        = "TCP"
    from_port       = 6379
    to_port         = 6379
    security_groups = [aws_security_group.todos_api.id, aws_security_group.lmp.id]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "auth_api" {
  name        = "auth-api-security-group-pjc"
  description = "Security group for the auth api server"

  vpc_id = data.aws_vpc.ramp_up_training.id

  tags = {
    project     = var.project_name
    responsible = var.responsable_name
  }


  ingress {
    protocol        = "TCP"
    from_port       = 8000
    to_port         = 8000
    security_groups = [aws_security_group.alb.id]
  }

  ingress {
    protocol        = "TCP"
    from_port       = 22
    to_port         = 22
    security_groups = [aws_security_group.bastion.id]
  }

  ingress {
    protocol        = "TCP"
    from_port       = 8000
    to_port         = 8000
    security_groups = [aws_security_group.frontend.id]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "frontend" {
  name        = "frontend-security-group-pjc"
  description = "Security group for the frontend server"

  vpc_id = data.aws_vpc.ramp_up_training.id

  tags = {
    project     = var.project_name
    responsible = var.responsable_name
  }

  ingress {
    protocol        = "TCP"
    from_port       = 8080
    to_port         = 8080
    security_groups = [aws_security_group.alb.id]
  }

  ingress {
    protocol        = "TCP"
    from_port       = 22
    to_port         = 22
    security_groups = [aws_security_group.bastion.id]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "lmp" {
  name        = "lmp-security-group-pjc"
  description = "Security group for the lmp server"

  vpc_id = data.aws_vpc.ramp_up_training.id

  tags = {
    project     = var.project_name
    responsible = var.responsable_name
  }

  ingress {
    protocol        = "TCP"
    from_port       = 22
    to_port         = 22
    security_groups = [aws_security_group.bastion.id]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "todos_api" {
  name        = "todos-api-security-group-pjc"
  description = "Security group for the todos api server"

  vpc_id = data.aws_vpc.ramp_up_training.id

  tags = {
    project     = var.project_name
    responsible = var.responsable_name
  }


  ingress {
    protocol        = "TCP"
    from_port       = 8082
    to_port         = 8082
    security_groups = [aws_security_group.alb.id]
  }


  ingress {
    protocol        = "TCP"
    from_port       = 22
    to_port         = 22
    security_groups = [aws_security_group.bastion.id]
  }

  ingress {
    protocol        = "TCP"
    from_port       = 8082
    to_port         = 8082
    security_groups = [aws_security_group.frontend.id]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}


resource "aws_security_group" "users_api" {
  name        = "users-api-security-group-pjc"
  description = "Security group for the users api server"

  vpc_id = data.aws_vpc.ramp_up_training.id

  tags = {
    project     = var.project_name
    responsible = var.responsable_name
  }


  ingress {
    protocol        = "TCP"
    from_port       = 8083
    to_port         = 8083
    security_groups = [aws_security_group.alb.id]
  }

  ingress {
    protocol        = "TCP"
    from_port       = 22
    to_port         = 22
    security_groups = [aws_security_group.bastion.id]
  }

  ingress {
    protocol        = "TCP"
    from_port       = 8083
    to_port         = 8083
    security_groups = [aws_security_group.auth_api.id]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


}

resource "aws_security_group" "zipkin" {
  name        = "zipkin-security-group-pjc"
  description = "Security group for the zipkin server"

  vpc_id = data.aws_vpc.ramp_up_training.id

  tags = {
    project     = var.project_name
    responsible = var.responsable_name
  }


  ingress {
    protocol        = "TCP"
    from_port       = 9411
    to_port         = 9411
    security_groups = [aws_security_group.alb.id]
  }

  ingress {
    protocol  = "TCP"
    from_port = 9411
    to_port   = 9411
    security_groups = [aws_security_group.frontend.id, aws_security_group.auth_api.id,
    aws_security_group.users_api.id, aws_security_group.todos_api.id, aws_security_group.lmp.id, aws_security_group.bastion.id]
  }

  ingress {
    protocol        = "TCP"
    from_port       = 22
    to_port         = 22
    security_groups = [aws_security_group.bastion.id]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
