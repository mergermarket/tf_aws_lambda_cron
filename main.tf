resource "aws_lambda_function" "lambda_function" {
  s3_bucket     = "${var.s3_bucket}"
  s3_key        = "${var.s3_key}"
  function_name = "${var.function_name}"
  role          = "${aws_iam_role.iam_for_lambda.arn}"
  handler       = "${var.handler}"
  runtime       = "${var.runtime}"

  environment {
    variables = "${var.lambda_env}"
  }
}

resource "aws_cloudwatch_event_rule" "cron_five_minutes" {
  name                = "cron_five_minutes"
  description         = "Fires every five minutes"
  schedule_expression = "rate(5 minutes)"
}

resource "aws_cloudwatch_event_target" "call_lambda_every_five_minutes" {
  rule      = "${aws_cloudwatch_event_rule.cron_five_minutes.name}"
  target_id = "lambda_function"
  arn       = "${aws_lambda_function.lambda_function.arn}"
}

resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.lambda_function.function_name}"
  principal     = "events.amazonaws.com"
  source_arn    = "${aws_cloudwatch_event_rule.cron_five_minutes.arn}"
}

output "lambda_arn" {
  value = "${aws_lambda_function.lambda_function.arn}"
}
