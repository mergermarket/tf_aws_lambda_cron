# AWS Lambda Cron Terraform Module

[![Build Status](https://travis-ci.org/mergermarket/tf_aws_lambda_cron.svg?branch=master)](https://travis-ci.org/mergermarket/tf_aws_lambda_cron)

This module will deploy a lambda function and a cron rule to run the lambda function on a schedule.

## Module Input Variables

- `s3_bucket` - (string) - **REQUIRED** - The name of the bucket containing your uploaded lambda deployment package
- `s3_key` - (string) - **REQUIRED** - The s3 key for your Lambda deployment package
- `function_name` - (string) - **REQUIRED** - The name of the lambda function
- `handler` - (map) - **REQUIRED** - The function within your code that Lambda calls to begin execution.
- `runtime` - (string) - **REQUIRED** The runtime environment for the Lambda function you are uploading.
- `lambda_env` - (string) - Environment parameters passed to the lambda function
- `lambda_iam_policy_name` (string) - **REQUIRED** - The name for the Lambda functions IAM policy
- `lambda_cron_schedule` (string) - **REQUIRED** - The scheduling expression. For example, cron(0 20 \* \* ? \*) or rate(5 minutes).
- `subnet_ids` (list) - _optional_ - The ids of VPC subnets to run in.
- `security_group_ids` (list) - _optional_ - The ids of VPC security groups to assign to the lambda.
- `timeout` (string) - _optional_ - The number of seconds the lambda will be allowed to run for.

## Usage

```hcl
module "lambda-function" {
  source                    = "github.com/mergermarket/tf_aws_lambda"
  s3_bucket                 = "s3_bucket_name"
  s3_key                    = "s3_key_for_lambda"
  function_name             = "do_foo"
  handler                   = "do_foo_handler"
  runtime                   = "nodejs"
  lambda_env                = "${var.lambda_env}"
  lambda_cron_schedule      = "rate(5 minutes)"
}
```
Lambda environment variables file:
```json
{
  "lambda_env": {
    "environment_name": "ci-testing"
  }
}
```
