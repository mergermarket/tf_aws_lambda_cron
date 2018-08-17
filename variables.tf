// Required Variables
variable "s3_bucket" {
  description = "The name of the bucket containing your uploaded Lambda deployment package."
}

variable "s3_key" {
  description = "The s3 key for your Lambda deployment package."
}

variable "function_name" {
  description = "The name of the Lambda function."
}

variable "handler" {
  description = "The function within your code that Lambda calls to begin execution."
}

variable "runtime" {
  description = "The runtime environment for the Lambda function you are uploading."
}

variable "lambda_cron_schedule" {
  description = "The sceduling expression for how often the Lambda function runs."
}

variable "subnet_ids" {
  type        = "list"
  description = "The VPC subnets in which the Lambda runs"
}

variable "security_group_ids" {
  type        = "list"
  description = "The VPC security groups assigned to the Lambda"
}

// Optional Variables
variable "timeout" {
  description = "The maximum time in seconds that the Lambda can run for"
  default     = 3
}

variable "memory_size" {
  description = "The memory in Gb that the function can use"
  default     = 128
}

variable "lambda_env" {
  description = "Environment parameters passed to the Lambda function."
  type        = "map"
  default     = {}
}

variable "lambda_iam_policy_name" {
  description = "[DEPRECATED] The name for the Lambda functions IAM policy."
  default     = ""
}

variable "is_enabled" {
  description = "Whether the rule should be enabled. (Defaults to True)"
  default     = true
}
