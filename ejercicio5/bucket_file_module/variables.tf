variable "bucket_name" {
  description = "Name of the bucket"
  type        = string
}

variable "file_content" {
  description = "Content of the file to be uploaded to S3"
  type        = string
}