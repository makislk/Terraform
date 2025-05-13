terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  service_account_key_file = "key.json"
  cloud_id = "b1grv58fqsh8ghgqh83m"
  folder_id = "b1g4tp0bq6lsue8rnm1l"
  zone = "ru-central1-a"
}
