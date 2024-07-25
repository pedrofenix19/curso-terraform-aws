resource "local_file" "file_to_upload" {
  filename = "${path.module}/temp.txt"
  content  = var.file_content
}

# S3 bucket resource
resource "aws_s3_bucket" "bucket_ejemplo" {
  bucket = var.bucket_name
}

# S3 bucket object resource
resource "aws_s3_object" "s3_object" {
  bucket = bucket_ejemplo.example.bucket
  key    = "example.txt"
  source = local_file.example.filename
}

resource "null_resource" "delete_temp_file" {
  provisioner "local-exec" {
    command = "rm -f ${path.module}/temp.txt"
  }

  depends_on = [ aws_s3_object.s3_object ]
}