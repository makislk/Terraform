virtual_machines = {
    "vm-1" = {
      vm_name      = "balancer-nginx-monitoring-zabbix" # Имя ВМ
      vm_platform_id  = "standard-v3" # Платформа, Broadwell по умолчанию (v1)
      vm_desc      = "Балансировщик" # Описание
      vm_preemptible = true # Прерываемая или нет ВМ
      vm_cpu       = 2 # Кол-во ядер процессора
      vm_core_fraction = 20 # Базовая производительность процессора, %
      ram          = 2 # Оперативная память в ГБ
      disk         = 20 # Объём диска в ГБ
      disk_name    = "debian11disk1" # Название диска
      template     = "fd8qh3qqmbq35jn5920n" # ID образа ОС для использования
    },
    "vm-2" = {
      vm_name      = "mwiki-bd-1" # Имя ВМ
      vm_platform_id  = "standard-v3" # Платформа, Broadwell по умолчанию (v1)
      vm_desc      = "Описание для инженеров. Его видно только здесь"
      vm_preemptible = true # Прерываемая или нет ВМ
      vm_cpu       = 2 # Кол-во ядер процессора
      vm_core_fraction = 20 # Базовая производительность процессора, %
      ram          = 2 # Оперативная память в ГБ
      disk         = 20 # Объём диска в ГБ
      disk_name    = "debian11disk2" # Название диска
      template     = "fd8qh3qqmbq35jn5920n" # ID образа ОС для использования
    },
    "vm-3" = {
      vm_name      = "mwiki-bd-2" # Имя ВМ
      vm_platform_id  = "standard-v3" # Платформа, Broadwell по умолчанию (v1)
      vm_desc      = "Описание для инженеров. Его видно только здесь"
      vm_preemptible = true # Прерываемая или нет ВМ
      vm_cpu       = 2 # Кол-во ядер процессора
      vm_core_fraction = 20 # Базовая производительность процессора, %
      ram          = 2 # Оперативная память в ГБ
      disk         = 20 # Объём диска в ГБ
      disk_name    = "debian11disk3" # Название диска
      template     = "fd8qh3qqmbq35jn5920n" # ID образа ОС для использования
    }
}
