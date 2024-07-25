resource "local_file" "archivo_texto" {
  filename = "${path.module}/hola.txt"
  content  = var.file_content
}