/*
locals {
  module_tag = {
    "module" = basename(abspath(path.module))
  }

  tags = merge(local.module_tag, try(var.settings.tags, null))
}
*/