resource "aws_vpc" "cluster_vpc" {
  cidr_block       = var.cidr_blocks
  instance_tenancy = "default"
  enable_dns_support = false
  enable_dns_hostnames = false

  tags = merge(
  var.default_tags,
    map(
    "Name", "${var.cluster_name}",
    "kubernetes.io/cluster/${var.cluster_name}", "owned"
    )
  )
}
