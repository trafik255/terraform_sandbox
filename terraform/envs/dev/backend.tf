terraform {
    backend "s3" {
        bucket         = "your-tf-state-bucket"
        key            = "dev/s3.tfstate"
        region         = "us-east-2"
        dynamodb_table = "terraform-locks"
        encrypt        = true
    }
}