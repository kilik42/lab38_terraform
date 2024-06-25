terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.27.0"
    }
  }
}

resource "google_compute_instance" "vm-from-tf" {
  name  = "vm-from-tf"
  machine_type = "e2-micro"
  zone  = "us-central1-a"
 
 allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size = 20

    }
    auto_delete = true
  }

  labels = {
    "env" = "tflearning"
  }

  scheduling {
    preemptible = false
    automatic_restart = false
  }

  service_account {
    email ="terraformcomputeengine01@terraf-392514.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
  network_interface {
    network = "test01"
    subnetwork = "test-network01"
    access_config {

    }
  }
}