provider "aws" {
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_get_ec2_platforms      = true
  skip_region_validation      = true
  skip_requesting_account_id  = true
  max_retries                 = 1
  access_key                  = "a"
  secret_key                  = "a"
  region                      = "eu-west-1"
}

module "lambda" {
  source                 = "../.."
  s3_bucket              = "cdflow-lambda-releases"
  s3_key                 = "s3key.zip"
  function_name          = "check_lambda_function"
  handler                = "some_handler"
  runtime                = "python"
  lambda_env             = "${var.lambda_env}"
  lambda_iam_policy_name = "lambda-IAM-policy-name"
}

variable "lambda_env" {
  description = "Environment parameters passed to the lambda function"
  type        = "map"
  default     = {}
}

output "lambda_function_arn" {
  value = "${module.lambda.lambda_arn}"
}
