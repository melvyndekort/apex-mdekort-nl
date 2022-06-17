terraform {
  backend "s3" {
    bucket     = "mdekort.tfstate"
    key        = "apex-mdekort-nl.tfstate"
    region     = "eu-west-1"
    role_arn   = "arn:aws:iam::075673041815:role/AdminRole"
    encrypt    = "true"
    kms_key_id = "arn:aws:kms:eu-west-1:075673041815:alias/generic"
  }
}

data "terraform_remote_state" "cloudsetup" {
  backend = "s3"

  config = {
    bucket = "mdekort.tfstate"
    key    = "cloudsetup.tfstate"
    region = "eu-west-1"
  }
}
