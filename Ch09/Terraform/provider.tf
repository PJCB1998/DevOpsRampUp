provider "aws" {
  region = "us-west-1"
}

terraform {
  required_version = ">= 1.5.5"
  
   backend "s3" {
    bucket = "ramp-up-devops-psl"
    key    = "pablo.calleb/terrafrom.tfstate"
    region = "us-west-1"
  }
  
  }
  
