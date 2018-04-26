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

variable "timeout" {
  description = "The maximum time in seconds that the Lambda can run for"
  default     = 3
}

variable "lambda_env" {
  description = "Environment parameters passed to the Lambda function."
  type        = "map"
  default     = {}
}
