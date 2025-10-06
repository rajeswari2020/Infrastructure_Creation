provider "aws" {
  region     = "ap-south-1"
}

resource "aws_s3_bucket" "demo-bucket" {
  bucket = "demo-terraform-eks-state-bucket-sample-demo2"

 lifecycle {
    prevent_destroy = false
 }
}

resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "demo-terraform-eks-state-locks"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
