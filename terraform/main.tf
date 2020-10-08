provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

resource "yandex_kubernetes_cluster" "k8s-cluster" {
  name        = "k8s-cluster"
  description = "k8s test cluster"

  network_id = var.network_id

  master {
    version = var.k8s_version
    zonal {
      zone      = var.zone
      subnet_id = var.sub_net_id
    }

    public_ip = true

    maintenance_policy {
      auto_upgrade = true
    }
  }

  service_account_id      = var.service_account_id
  node_service_account_id = var.service_account_id

  labels = {
    key       = "k8s-sa"
  }

  release_channel         = "REGULAR"
  network_policy_provider = "CALICO"
}

resource "yandex_kubernetes_node_group" "nodes" {
  cluster_id = yandex_kubernetes_cluster.k8s-cluster.id
  name       = "k8s-cluster-nodes"
  version    = var.k8s_version

  labels = {
    "key" = "k8s-sa"
  }

  instance_template {
    platform_id = "standard-v2"
    nat         = true

    resources {
      memory = 2
      cores  = 2
    }

    boot_disk {
      type = "network-hdd"
      size = 64
    }

    scheduling_policy {
      preemptible = false
    }
  }

  scale_policy {
    fixed_scale {
      size = 1
    }
  }

  allocation_policy {
    location {
      zone = var.zone
    }
  }
}
