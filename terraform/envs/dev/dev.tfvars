bucket_name = "dev-demo-${random-integer.suffix.result}"
project_id  = "dev-demo"
owner       = "platform"


resource "rnadom_integer" "suffix" {
  min = 10000
  max = 99999
}