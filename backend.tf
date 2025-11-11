terraform {
  backend "s3" {
    bucket         = "terraform-state-anil"
    key            = "env/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
