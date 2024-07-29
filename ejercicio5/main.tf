module "bucket_1" {
  source = "./bucket_file_module"
  bucket_name = "pedro-module-test-bucket-1"
  file_content = "Contenido del archivo 1"
}