variable "env" {
  type = map(string)
  default = {
    prod     = "prod"
    staging  = "staging"
  }
}

variable "role_arn" {
  description = "role arn for initiate iam role"
  default = "arn:aws:iam::061051262837:role/tf-redikru"
}

variable "EXTERNAL_ID" {
  type      = string
  description = "external id for authentication aws asumerole, defaining on local environment variable"
}

variable "region" {
  description = "AWS Region to deploy to"
  default     = "ap-southeast-1"
}


variable "vpc_cidr_webapp" {
  type = map(string)
  default = {
    staging  = "10.104.32.0/21"
    prod = "10.104.40.0/21"
  }
}

# ----------------------------------------------
#  Subnet
# ----------------------------------------------
# Private

variable "webapp_privateA" {
  type = map(string)
  description = "Private subnet for webapp zone 1a"
  default     = {
    staging   = "10.104.33.0/24"
    prod      = "10.104.41.0/24"
  }
}

variable "webapp_privateB" {
  type = map(string)
  description = "Private subnet for webapp zone 1b"
  default     = {
    staging   = "10.104.37.0/24"
    prod      = "10.104.45.0/24"
  }
}

#PUBLIC
variable "webapp_publicA" {
  type = map(string)
  description = "Public subnet for webapp zone 1a"
  default     = {
    staging   = "10.104.32.0/24"
    prod      = "10.104.40.0/24"
  }
}

variable "webapp_publicB" {
  type = map(string)
  description = "Public subnet for webapp zone 1b"
  default     = {
    staging   = "10.104.36.0/24"
    prod      = "10.104.44.0/24"
  }
}

# ----------------------------------------------
#  Internet Gateway
# ----------------------------------------------

# variable share_transit_gateway {
#   description = "share tgw from account network"
#   default = "tgw-0312bf0f0873d4be4"
# }

# ------------------------------------
#  Resources TAGS
# ------------------------------------
# Tag Variables
variable "environment" {
  description = "Target Environment"
  default     = {
    prod      = "PROD"
    staging   = "STAGING"
  }
}

variable "department" {
  description = "Department Owner"
  default     = "DEVOPS"
}


variable "sg" {
  default = {
    staging = {
      sg = [
        {
          name        = "allow_shh_private"
          description = "Allow ssh private"
          vpc_id      = 0
          ingress = [
            {
              description = "ssh"
              from_port   = 22
              to_port     = 22
              protocol    = "tcp"
              cidr_blocks = ["10.104.33.0/24","10.104.37.0/24"]
            }
          ]
        },
        {
          name        = "allow_shh_bastion_host"
          description = "Allow ssh bastion host"
          vpc_id      = 0
          ingress = [
            {
              description = "ssh"
              from_port   = 22
              to_port     = 22
              protocol    = "tcp"
              cidr_blocks = ["0.0.0.0/0"]
            }
          ]
        }
      ]
    }
  }
}