terraform {
  backend "gcs" {
    bucket      = "${var.bucket_name}"
    credentials = "bucket_project_name-backend.json"
    prefix      = "web/web.tfstate"
  }
}