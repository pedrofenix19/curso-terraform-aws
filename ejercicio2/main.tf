provider "local" {
  # Local provider configuration
}

# Define a variable for file names
variable "file_names" {
  description = "List of file names to be created"
  type        = list(string)
  default     = ["archivo1.txt", "archivo2.txt", "archivo3.txt"]
}

# Define a variable for file contents
variable "file_contents" {
  description = "List of file contents for each file"
  type        = list(string)
  default     = ["Contenido del archivo1", "Contenido del archivo2", "Contenido del archivo3"]
}

# Define a local file for each file name and content using a loop
resource "local_file" "files" {
  count    = length(var.file_names)  # Loop through the list of file names
  filename = "${path.module}/${var.file_names[count.index]}"  # Interpolate file name
  content  = jsonencode({
    nombre_archivo = var.file_names[count.index]  # Interpolate file name in JSON
    contenido   = var.file_contents[count.index]  # Interpolate file content in JSON
  })
}

output "file_paths" {
  value = [for f in local_file.files : f.filename]  # List of generated file paths
}
