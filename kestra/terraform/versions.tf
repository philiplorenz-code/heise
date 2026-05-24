terraform {
  required_version = ">= 1.5"

  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.49"
    }
  }

  # Hetzner Object Storage als S3-kompatibles State-Backend
  # Credentials kommen aus Umgebungsvariablen:
  #   AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY
  # Bucket und Endpoint kommen aus TF_BACKEND_BUCKET / TF_BACKEND_ENDPOINT
  # oder werden beim `terraform init -backend-config=...` übergeben.
  #
  # Initialisierung:
  #   source .env
  #   terraform init \
  #     -backend-config="bucket=$TF_BACKEND_BUCKET" \
  #     -backend-config="endpoint=$TF_BACKEND_ENDPOINT"
  backend "s3" {
    key    = "kestra-demo/terraform.tfstate"
    region = "eu-central"

    # Pflicht-Flags für non-AWS S3-Backends
    skip_requesting_account_id  = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    use_path_style              = true

    # bucket + endpoints.s3 werden beim init via -backend-config übergeben
    # (siehe Makefile / init-Anleitung)
  }
}
