resource google_compute_instance "instance" {
  name                  =  var.vm_name
  hostname              =  var.hostname 
  description           =  var.tag group
  machine_type          =  var.machine_type
  zone                  =  var.zone_id
  project               =  var.service_project
  allow_stopping_for_update = true
  tags                  = "var.tag"
}
resource "google_compute_disk" "boot-disk" {
  name  = disk1
  type  = boot
  zone  = var.zone_id
  size  = var.disk_size
  image = var.image
  type  = var.disk_type

  disk_encryption_key {
    kms_key_self_link = var.kms_key
  }
    network_interface {
    subnetwork         = "${var.name}-subnet"
    subnetwork_project = var.service_project
	address_type = "INTERNAL"
    
  }
}
 resource "google_service_account" "sreenu" {
  project      = var.service_project
  account_id   = "${var.deployment_name}"
  display_name = "Service Account for test project"
}

