bucket_name = "dev-demo-${random_integer.suffix.result}"
project_id  = "dev-demo"
owner       = "platform"


resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}