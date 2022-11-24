variable "project_id" {
  type    = string
  default = ""
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "instance_name" {
  type    = string
  default = "terraform-instance"
}

variable "bucket_name" {
  type    = string
  default = "terraform-bucket-anksatya"
}

variable "instance_machine_type" {
  type    = string
  default = "e2-micro"
}