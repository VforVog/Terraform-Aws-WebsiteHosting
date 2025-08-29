#terraform_bucket_website - Its the local name of the bucket within Terraform
resource "aws_s3_bucket" "terraform_bucket_website" {

  bucket = var.bucketname

  }


resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.terraform_bucket_website.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.terraform_bucket_website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [aws_s3_bucket_ownership_controls.example]

  bucket = aws_s3_bucket.terraform_bucket_website.id
  acl    = "private"
}


resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.terraform_bucket_website.id
  key    = "index.html" # the name of the file in the bucket
  source = "index.html" # the path of the file
  acl    = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.terraform_bucket_website.id
  key    = "error.html" # the name of the file in the bucket
  source = "error.html" # the path of the file
  acl    = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "alpaca" {
  bucket = aws_s3_bucket.terraform_bucket_website.id
  key    = "alpaca.jpeg" # the name of the file in the bucket
  source = "alpaca.jpeg" # the path of the file
  acl    = "public-read"
  content_type = "image/jpeg"
}


resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.terraform_bucket_website.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  depends_on = [ aws_s3_bucket.terraform_bucket_website ]

}