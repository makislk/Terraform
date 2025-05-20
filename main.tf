resource "yandex_compute_disk" "boot-disk-gw" {
  for_each = var.virtual_gateways
  name     = each.value["disk_name"]
  type     = "network-hdd"
  zone     = "ru-central1-a"
  size     = each.value["vm_gw_disk"]
  image_id = each.value["template"]
}
# Создание статического IP-адреса.
resource "yandex_vpc_address" "addr" {
  name = "ExternalAddress"
    deletion_protection = "false"
    external_ipv4_address {
    zone_id = "ru-central1-a"
  }
}
resource "yandex_vpc_network" "network-1" {
  name = "network1"
}
resource "yandex_vpc_subnet" "private" {
  name           = "private"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}
resource "yandex_compute_instance" "virtual_machine" {
  for_each    = var.virtual_gateways
  name        = each.value["vm_name"]
  platform_id = each.value["vm_platform_id"]
  resources {
    cores         = each.value["vm_cpu"]
    core_fraction = each.value["vm_core_fraction"]
    memory        = each.value["ram"]
  }
  scheduling_policy {
    preemptible = each.value["vm_preemptible"]
  }
  boot_disk {
    disk_id = yandex_compute_disk.boot-disk-gw[each.key].id
  }

 network_interface {
    subnet_id = yandex_vpc_subnet.private.id
    nat            = true
    nat_ip_address = yandex_vpc_address.addr.external_ipv4_address[0].address
  }
  metadata = {
    user-data = "${file("meta.txt")}"
  }
}

resource "yandex_compute_disk" "boot-disk-vm" {
  for_each = var.virtual_machines
  name     = each.value["disk_name"]
  type     = "network-hdd"
  zone     = "ru-central1-a"
  size     = each.value["disk"]
  image_id = each.value["template"]
}

resource "yandex_compute_instance" "virtual_machines" {
  for_each    = var.virtual_machines
  name        = each.value["vm_name"]
  platform_id = each.value["vm_platform_id"]
  resources {
    cores         = each.value["vm_cpu"]
    core_fraction = each.value["vm_core_fraction"]
    memory        = each.value["ram"]
  }
  scheduling_policy {
    preemptible = each.value["vm_preemptible"]
  }
  boot_disk {
    disk_id = yandex_compute_disk.boot-disk-vm[each.key].id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.private.id
    nat       = false
    }
  metadata = {
    user-data = "${file("meta.txt")}"
  }
}
