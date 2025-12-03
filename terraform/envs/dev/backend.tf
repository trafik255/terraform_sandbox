terraform {
  backend "s3" {
    bucket         = "tfstate-global-backend"
    key            = "dev/s3.tfstate"
    region         = "us-east-2"
    dynamodb_table = "tfstate-locks"
    encrypt        = true
  }
}
