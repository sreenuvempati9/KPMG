provider "google" {
  credentials = "${file("credentials.json")}"
  project     = "${var.service_project}"
  region      = "${var.region_id}"
}


module "vpc" {
  source = "./modules/vpc"
  bucket_name     = demo-bucket
  region          = "europe-west2"
  gcp_project     = "test-project"
  credentials     = "credentials.json"
  name            = "dev"
  subnet_cidr     = "10.10.0.0/24"
  
}
