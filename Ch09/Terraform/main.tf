data "aws_vpc" "ramp_up_training" {

  filter  {

    name = "tag:Name"
    values = ["ramp_up_training"]

  }

}

data "aws_subnet" "ramp_up_training_public_1" {

  filter  {

      name = "tag:Name"
      values = ["ramp_up_training-public-1"] 
  }


}

data "aws_subnet" "ramp_up_training_public_0" {

  filter  {

      name = "tag:Name"
      values = ["ramp_up_training-public-0"] 
  }

}


data "aws_subnet" "ramp_up_training_private_1" {

  filter  {

      name = "tag:Name"
      values = ["ramp_up_training-private-1"]
  }

}

data "aws_subnet" "ramp_up_training_private_0" {

  filter  {

      name = "tag:Name"
      values = ["ramp_up_training-private-0"]
  }

}


data "aws_nat_gateway"  "ramp_up_training_nat_gateway" {

  filter  {

    name = "tag:Name"
    values = ["ramp_up_training-nat-gateway"]

  }

}

data "aws_internet_gateway" "ramp_up_training_internter_gateway" {

  filter  {

    name = "tag:Name"
    values = ["ramp_up_training-internet-gateway"]

  }

}


data "aws_route_table" "ramp_up_training_private" {

  filter  {

    name = "tag:Name"
    values = ["ramp_up_training_private"]

  }


}



data "aws_route_table" "ramp_up_training_public" {

  filter  {

    name = "tag:Name"
    values = ["ramp_up_training_public"]

  }


}

resource "aws_key_pair" "tf-key-pair" {
  key_name   = "tf-key-pair"
  public_key = tls_private_key.rsa.public_key_openssh
  
  tags = {
    project    = var.project_name
    responsible = var.responsable_name
  }
}
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "local_file" "tf-key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "tf-key-pair"
}
