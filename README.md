# <p align="center">🌐 Terraform AWS Static Website Hosting</p>

## Project Overview
This project demonstrates using **Terraform** and **AWS Cloud** to set up **a fully automated static website hosting** on Amazon S3, managed entirely with Terraform that you can **destroy and recreate withing seconds!** The main objectives are:  

- Create an **S3 bucket**  
- Configure the bucket to **host a static website**  
- Upload website files (HTML, CSS, images)  
- Enable **public access** for the bucket  
- Retrieve the **website endpoint** to access the site  


## Features & Steps

### 1. Define the Provider 
- Create a `provider.tf` file.  
- Reference the **AWS provider** from the Terraform documentation.  
- Run `terraform init` to initialize Terraform, download dependencies, and set up API access.  

### 2. Create S3 Bucket
- Use Terraform’s S3 Bucket resource to define the bucket.  
- Keep **bucket configuration** and **variables** separate.  
- Run `terraform plan` to preview changes, then `terraform apply` to create the bucket.  
- Add **ownership controls** to ensure the bucket belongs to you.  
- Configure the **ACL (Access Control List)** to allow public access.  
- Enable **Static Website Hosting** for the bucket.  

### 3. Create HTML File
- Prepare website files such as `index.html`, `error.html`, and any images (e.g., `alpaca.jpeg`).  

### 4. Upload Objects to S3
- Use Terraform’s `aws_s3_object` resource to upload website files to the S3 bucket.  
- Make sure all files required for the website are uploaded.  

### 5. Configure Website
- Use the `aws_s3_bucket_website_configuration` resource to set the **index document** and **error document**.  
- After applying the Terraform configuration, the static website is live and accessible via the S3 website endpoint.  

### 6. Destroy and Recreate
- Run `terraform destroy` to remove all resources.  
- Use an output block in Terraform:

```hcl
output "websiteendpoint" {
  value = aws_s3_bucket.terraform_bucket_website.website_endpoint
}
```
<br><br>
## Simulation
![Live Demo](gif/gif.gif) 

<br><br>
📌 Notes

Terraform AWS provider binary (terraform-provider-aws_v6.11.0_x5) is large and not included in this repository.
