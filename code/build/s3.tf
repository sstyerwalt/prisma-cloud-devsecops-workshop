provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "dev_s3" {
  bucket_prefix = "dev-"

  tags = {
    Environment          = "Dev"
    yor_name             = "dev_s3"
    yor_trace            = "e09b4379-b740-4f84-b106-974d6911a91a"
    git_commit           = "519968eb545a947fbed4575cf24d9fd2d562ad56"
    git_file             = "code/build/s3.tf"
    git_last_modified_at = "2025-05-14 21:43:05"
    git_last_modified_by = "steve@foghornconsulting.com"
    git_modifiers        = "steve"
    git_org              = "sstyerwalt"
    git_repo             = "prisma-cloud-devsecops-workshop"
  }
}

resource "aws_s3_bucket_ownership_controls" "dev_s3" {
  bucket = aws_s3_bucket.dev_s3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
