/* vpc required*/
variable "vpc_cidr_block" {
}

variable "vpc_name" {
}

/* subnet required*/
variable "public_subnets" {
  type        = list(map(string))
  description = "subnetのcidr_blockとavailability_zoneの設定が入ったmapのlistを入れる(作りたいsubnet分)"
}

