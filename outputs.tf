output "websiteendpoint" {
  value = aws_s3_bucket.terraform_bucket_website.website_endpoint
  
}