resource "aws_alb" "alb" {

  name               = "alb-pjc"
  security_groups    = [aws_security_group.alb.id]
  load_balancer_type = "application"


  subnet_mapping {
    subnet_id = data.aws_subnet.ramp_up_training_public_1.id
  }

  subnet_mapping {
    subnet_id = data.aws_subnet.ramp_up_training_public_0.id
  }

  tags = {
    project    = var.project_name
    responsible = var.responsable_name
  }

}



resource "aws_alb_listener" "port_80" {
  load_balancer_arn = aws_alb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.frontend.arn
  }
}


resource "aws_lb_listener_rule" "path_routing_login_80" {
    listener_arn = aws_alb_listener.port_80.arn
    priority = 1

    action {
        type = "forward"
        target_group_arn = aws_lb_target_group.auth_api.arn
    }

    condition {
        path_pattern {
            values = ["*/login"]
        }
    }
}

resource "aws_lb_listener_rule" "path_routing_todos_80" {
    listener_arn = aws_alb_listener.port_80.arn
    priority = 2

    action {
        type = "forward"
        target_group_arn = aws_lb_target_group.todos_api.arn
    }

    condition {
        path_pattern {
            values = ["*/todos*"]
        }
    }
}

resource "aws_alb_listener" "port_8082" {
  load_balancer_arn = aws_alb.alb.arn
  port              = "8082"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.todos_api.arn
  }
}

resource "aws_alb_listener" "port_8083" {
  load_balancer_arn = aws_alb.alb.arn
  port              = "8083"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.users_api.arn
  }
}


resource "aws_alb_listener" "port_8000" {
  load_balancer_arn = aws_alb.alb.arn
  port              = "8000"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.auth_api.arn
  }
}

resource "aws_alb_listener" "port_6379" {
  load_balancer_arn = aws_alb.alb.arn
  port              = "6379"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.redis.arn
  }
}

resource "aws_alb_listener" "port_9411" {
  load_balancer_arn = aws_alb.alb.arn
  port              = "9411"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.zipkin.arn
  }
}

