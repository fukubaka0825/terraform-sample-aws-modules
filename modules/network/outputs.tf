/* vpc */
output "vpc_id" {
  value = aws_vpc.default.id
}

output "vpc_cidr_block" {
  value = aws_vpc.default.cidr_block
}

/* subnet */
output "public_subnets" {
  value = aws_subnet.default
}
//output "laboon_stage_subnet_private01_id" {
//  value = aws_subnet.laboon_stage_subnet_private01.id
//}
//output "laboon_stage_subnet_private02_id" {
//  value = aws_subnet.laboon_stage_subnet_private02.id
//}
