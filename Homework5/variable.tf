provider aws {
    region = var.region
}

variable region {
  default = ""
  type = string
}

variable instance_type  {
  default = ""
  type = string
}
