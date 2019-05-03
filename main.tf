# Use data sources to retrieve account number and region.

data "aws_caller_identity" "current" {}

data "aws_iam_role" "selected" {
  name = "lambda-edge-basic"
}

data "aws_region" "current" {}

locals {
  account_id = "${data.aws_caller_identity.current.account_id}"
  region     = "${data.aws_region.current.name}"
}

resource "aws_lambda_function" "default" {
  description   = "Serve directory index.html files for Cloudfront"
  function_name = "${var.function_name}"
  runtime       = "${var.runtime}"
  handler       = "index.handler"
  publish       = "true"
  role          = "${data.aws_iam_role.selected.arn}"
  s3_bucket     = "drone-${local.region}-${local.account_id}"
  s3_key        = "cloudfront-directory-index/cloudfront-directory-index.zip"
}

output "qualified_arn" {
  value = "${aws_lambda_function.default.qualified_arn}"
}
