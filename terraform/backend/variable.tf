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