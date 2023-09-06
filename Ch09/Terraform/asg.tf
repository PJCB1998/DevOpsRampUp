module "auth_api_asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "6.10.0"

  # Auto Scaling Gourp 
  name = "auth-api-asg-pjc"

  min_size                  = 1
  max_size                  = 2
  desired_capacity          = 1
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  vpc_zone_identifier       = [data.aws_subnet.ramp_up_training_private_1.id, data.aws_subnet.ramp_up_training_private_0.id]



  # Launch Template
  image_id      = "ami-0f8e81a3da6e2510a"
  instance_type = "t2.micro"

  launch_template_name = "auth-api-asg"

  user_data = base64encode(local.auth_user_data)

  tags = {
    project     = var.project_name
    responsible = var.responsable_name
  }
  security_groups = [aws_security_group.auth_api.id]

  target_group_arns = [aws_lb_target_group.auth_api.arn]

  key_name = aws_key_pair.tf-key-pair.key_name

  tag_specifications = [
    {
      resource_type = "instance"
      tags = {
        project = var.project_name
      responsible = var.responsable_name }
    },
    {
      resource_type = "volume"
      tags = {
        project = var.project_name
      responsible = var.responsable_name }
    },
  ]

}

module "todos_api_asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "6.10.0"

  # Auto Scaling Gourp 
  name = "todos-api-asg-pjc"

  min_size                  = 1
  max_size                  = 2
  desired_capacity          = 1
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  vpc_zone_identifier       = [data.aws_subnet.ramp_up_training_private_1.id, data.aws_subnet.ramp_up_training_private_0.id]

  # Launch Template
  image_id      = "ami-0f8e81a3da6e2510a"
  instance_type = "t2.micro"

  launch_template_name = "todos-api-asg"

  user_data = base64encode(local.todos_user_data)

  tags = {
    project     = var.project_name
    responsible = var.responsable_name
  }
  security_groups = [aws_security_group.todos_api.id]

  target_group_arns = [aws_lb_target_group.todos_api.arn]

  key_name = aws_key_pair.tf-key-pair.key_name

  tag_specifications = [
    {
      resource_type = "instance"
      tags = {
        project = var.project_name
      responsible = var.responsable_name }
    },
    {
      resource_type = "volume"
      tags = {
        project = var.project_name
      responsible = var.responsable_name }
    },
  ]

}


module "users_api_asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "6.10.0"

  # Auto Scaling Gourp 
  name = "users-api-asg-pjc"

  min_size                  = 1
  max_size                  = 2
  desired_capacity          = 1
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  vpc_zone_identifier       = [data.aws_subnet.ramp_up_training_private_1.id, data.aws_subnet.ramp_up_training_private_0.id]



  # Launch Template
  image_id      = "ami-0f8e81a3da6e2510a"
  instance_type = "t2.micro"

  launch_template_name = "users-api-asg"

  user_data = base64encode(local.users_user_data)

  tags = {
    project     = var.project_name
    responsible = var.responsable_name
  }

  security_groups = [aws_security_group.users_api.id]

  target_group_arns = [aws_lb_target_group.users_api.arn]

  key_name = aws_key_pair.tf-key-pair.key_name

  tag_specifications = [
    {
      resource_type = "instance"
      tags = {
        project = var.project_name
      responsible = var.responsable_name }
    },
    {
      resource_type = "volume"
      tags = {
        project = var.project_name
      responsible = var.responsable_name }
    },
  ]

}

module "frontend_asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "6.10.0"

  # Auto Scaling Gourp 
  name = "frontend-asg-pjc"

  min_size                  = 1
  max_size                  = 2
  desired_capacity          = 1
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  vpc_zone_identifier       = [data.aws_subnet.ramp_up_training_private_1.id, data.aws_subnet.ramp_up_training_private_0.id]

  # Launch Template
  image_id      = "ami-0f8e81a3da6e2510a"
  instance_type = "t2.micro"

  launch_template_name = "frontend-asg"

  user_data = base64encode(local.frontend_user_data)

  tags = {
    project     = var.project_name
    responsible = var.responsable_name
  }
  security_groups = [aws_security_group.frontend.id]

  target_group_arns = [aws_lb_target_group.frontend.arn]

  key_name = aws_key_pair.tf-key-pair.key_name

  tag_specifications = [
    {
      resource_type = "instance"
      tags = {
        project = var.project_name
      responsible = var.responsable_name }
    },
    {
      resource_type = "volume"
      tags = {
        project = var.project_name
      responsible = var.responsable_name }
    },
  ]

}

