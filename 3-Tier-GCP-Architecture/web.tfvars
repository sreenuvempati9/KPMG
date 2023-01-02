provider "google" {
  credentials = "${file("credentials.json")}"
  project     = "${var.service_project}"
  region      = "${var.region_id}"
}


module "web" {
  source = "./modules/web"
  bucket_name = "web"
  region_id = "europe-west2"
  service_project  = "test-project"
  hostname = "web-machine1"
  machine_type = "n1-highmem-16"
  zone_id = "europe-west2-a"
  image = "el67-ariba-may-2019"
  var.kms_key = "projects/ariba-prod-au1/locations/australia-southeast1/keyRings/prodau/cryptoKeys/web"
  tag = "web"
  disk_type = "pd-standard"
  disk_size = 100
  name = dev
  target = appmachine
  deployment_name = testuser
  
}



