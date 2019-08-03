/* required */
variable "aws_codebuild_project_name" {
}

variable "aws_codebuild_project_description" {
}


variable "codebuild_service_role" {
}

variable "artifacts_type" {
}

variable "source_type" {
}

variable "buildspec" {
}

/* if source_type = S3   required */
variable "source_location" {
  default = null
}

/* optional */
variable "compute_type" {
  default = "BUILD_GENERAL1_LARGE"
}

variable "image" {
  default = "aws/codebuild/standard:2.0-1.11.0"
}

variable "type" {
  default = "LINUX_CONTAINER"
}

variable "image_pull_credentials_type" {
  default = "CODEBUILD"
}

variable "privileged_mode" {
  default = true
}

variable "environment_variable" {
  type    = list(map(string))
  default = null
}

variable "cache_type" {
  default = "LOCAL"
}

variable "cache_modes" {
  type    = list(string)
  default = ["LOCAL_DOCKER_LAYER_CACHE", "LOCAL_SOURCE_CACHE", "LOCAL_CUSTOM_CACHE"]
}

variable "codebuild_tags" {
  type = map(string)
  default = {
    "Environment" = "test"
  }
}

