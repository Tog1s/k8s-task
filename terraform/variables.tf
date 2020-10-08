variable cloud_id {
  description = "Cloud"
}
variable folder_id {
  description = "Folder"
}
variable zone {
  description = "Zone"
  default     = "ru-central1-a"
}
variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable private_key_path {
  description = "Path to the private key used for ssh access"
}
variable subnet_id {
  description = "Subnet"
}
variable service_account_key_file {
  description = "key .json"
}
variable network_id {
  description = "Network id"
}
variable sub_net_id {
  description = " Sub Net id"
}
variable service_account_id {
  description = "Service account"
}
variable k8s_version {
  description = "Kubernetes version"
}
