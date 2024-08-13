variable "region" {
  type    = string
  default = "ap-southeast-1"
}

variable "env" {
  type = map(string)
  default = {
    staging = "staging"
    prod    = "prod"
  }
}

variable "keypair" {
  description = "keypair variable"
  type = list(object({
    name       = string
    public_key = string
  }))
  default = [
    {
      name       = "devops"
      public_key = "ssh-rsa AAAAB3NzaC1yc2**"
    }
  ]
}

variable "default_tags" {
  type = map(any)
  default = {
    staging = {
      Environment     = "STAGING"
      Department      = "DEVOPS"
      DepartmentGroup = "NONPROD-DEVOPS"
    }
    prod = {
      Environment     = "PROD"
      Department      = "DEVOPS"
      DepartmentGroup = "PROD-DEVOPS"
    }
  }
}
