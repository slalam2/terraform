variable "vm_name" {
  description = "Name of the VM"
  type        = list(string)
  default     = ["VM1", "VM2", "VM3"]


}
variable "location" {
  description = "Region to build into"
  type = string
  default     = "eastus"

}


