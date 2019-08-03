/* required */
variable "pipeline_name" {}
variable "role_arn" {}
variable "artifact_store_location" {}
variable "source_stage_name" {}
variable "S3Bucket" {}
variable "S3BucketID" {}
variable "S3ObjectKey" {}
variable "build_stage_name" {}
variable "deploy_stage_name" {}
//codebuildprojectのこと
variable "ProjectName" {}
variable "ClusterName" {}
variable "ServiceName" {}
variable "cw_role" {}
variable "cloudtrail_s3_id" {}
variable "cloudtrail_s3_key_prefix" {}
/* optional */
variable "PollForSourceChanges" {
  default = false
}
variable "FileName" {
  default = "imagedefinitions.json"
}
variable "artifact_store_type" {
  default = "S3"
}

variable "identifiers" {
  type    = list(string)
  default = ["582318560864"]
}
