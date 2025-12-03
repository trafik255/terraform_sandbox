resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}

module "s3" {
  source      = "../../modules/s3_bucket"
  bucket_name = "prod-demo-${random_integer.suffix.result}"
  project     = var.project
  owner       = var.owner
}
