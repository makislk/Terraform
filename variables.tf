variable "virtual_gateways" {
  default = {
    "vm-1" = {
      vm_name          = "balancer-nginx-monitoring-zabbix" # Имя ВМ
      vm_platform_id   = "standard-v3"                      # Платформа, Broadwell по умолчанию (v1)
      vm_desc          = "Балансировщик"                    # Описание
      vm_preemptible   = true                               # Прерываемая или нет ВМ
      vm_cpu           = 2                                  # Кол-во ядер процессора, 2 -минимум
      vm_core_fraction = 20                                 # Базовая производительность процессора, %
      ram              = 2                                  # Оперативная память в ГБ
      vm_gw_disk       = 20                                 # Объём диска в ГБ
      disk_name        = "ubuntu-22-04-lts-v20250505-disk1" # Название диска
      template         = "fd8136cthbfr503tjj72"             # ID образа ОС для использования
  }
}
}

variable "virtual_machines" {
  default = {
    "vm-2" = {
    vm_name          = "mwiki-bd-1"  # Имя ВМ
    vm_platform_id   = "standard-v3" # Платформа, Broadwell по умолчанию (v1)
    vm_desc          = "WikiMedia PostreSQL основные"
    vm_preemptible   = true                               # Прерываемая или нет ВМ
    vm_cpu           = 2                                  # Кол-во ядер процессора, 2 -минимум
    vm_core_fraction = 20                                 # Базовая производительность процессора, %
    ram              = 2                                  # Оперативная память в ГБ
    disk             = 20                                 # Объём диска в ГБ
    disk_name        = "ubuntu-22-04-lts-v20250505-disk2" # Название диска
    template         = "fd8136cthbfr503tjj72"             # ID образа ОС для использования
      },
  "vm-3" = {
    vm_name          = "mwiki-bd-2"  # Имя ВМ
    vm_platform_id   = "standard-v3" # Платформа, Broadwell по умолчанию (v1)
    vm_desc          = "WikiMedia PostreSQL резервные"
    vm_preemptible   = true                               # Прерываемая или нет ВМ
    vm_cpu           = 2                                  # Кол-во ядер процессора, 2 -минимум
    vm_core_fraction = 20                                 # Базовая производительность процессора, %
    ram              = 2                                  # Оперативная память в ГБ
    disk             = 20                                 # Объём диска в ГБ
    disk_name        = "ubuntu-22-04-lts-v20250505-disk3" # Название диска
    template         = "fd8136cthbfr503tjj72"             # ID образа ОС для использования
  }
}
}

variable "TF_CLI_ARGS_plan" {
  default = "100"
}
variable "TF_CLI_ARGS_apply" {
  default = "100"
}