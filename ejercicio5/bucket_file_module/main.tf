resource "local_file" "file_to_upload" {
  filename = "${path.module}/${var.bucket_name}_temp.txt"
  content  = var.file_content
}

# S3 bucket resource
resource "aws_s3_bucket" "bucket_ejemplo" {
  bucket = var.bucket_name
}

# S3 bucket object resource
resource "aws_s3_object" "s3_object" {
  bucket = aws_s3_bucket.bucket_ejemplo.bucket
  key    = "example.txt"
  source = local_file.file_to_upload.filename
}

resource "null_resource" "delete_temp_file" {
  provisioner "local-exec" {
    command = "Remove-Item ${local_file.file_to_upload.filename}"
  }

  depends_on = [ aws_s3_object.s3_object ]
}