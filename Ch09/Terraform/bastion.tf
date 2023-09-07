data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

resource "aws_security_group" "bastion" {

  name = "bastion-security-group-pjc"

  description = "Security group used for the bastion server"

  tags = {
    project     = var.project_name
    responsible = var.responsable_name
  }


  ingress {
    protocol    = "TCP"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  }

  ingress {
    protocol    = "TCP"
    from_port   = 9411
    to_port     = 9411
    cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = data.aws_vpc.ramp_up_training.id

}

module "bastion" {

  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.5.0"

  ami           = "ami-0f8e81a3da6e2510a"
  instance_type = "t2.small"
  name          = "bastion-ec2-pjc"
  subnet_id     = data.aws_subnet.ramp_up_training_public_1.id
  instance_tags = {
    project     = var.project_name
    responsible = var.responsable_name
  }
  volume_tags = {
    project     = var.project_name
    responsible = var.responsable_name
  }

  vpc_security_group_ids = [aws_security_group.bastion.id]

  key_name = aws_key_pair.tf-key-pair.key_name

  user_data = base64encode(local.bastion_user_data)

}

