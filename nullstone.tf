terraform {
  required_providers {
    ns = {
      source = "nullstone-io/ns"
    }
  }
}

data "ns_workspace" "this" {}

locals {
  tags       = data.ns_workspace.this.tags
  block_name = data.ns_workspace.this.block_name
}
