data "archive_file" "selected" {
  type        = "zip"
  source_file = "${path.module}/index.js"
  output_path = "${path.module}/index.zip"
}

data "aws_iam_role" "selected" {
  name = var.iam_role_name
}

resource "aws_lambda_function" "default" {
  description      = "Serve directory index.html files for Cloudfront"
  function_name    = var.function_name
  runtime          = var.runtime
  handler          = "index.handler"
  publish          = true
  role             = data.aws_iam_role.selected.arn
  filename         = data.archive_file.selected.output_path
  source_code_hash = data.archive_file.selected.output_base64sha256
}

# CloudFront requires a version, and does not support the use of
# $LATEST. Terraform's data source for aws_lambda_function returns
# $LATEST for the qualified ARN. To work around this we create an
# alias latest that points to the most recently published version
# of the lambda code.
#
# https://github.com/terraform-providers/terraform-provider-aws/issues/10038
resource "aws_lambda_alias" "default" {
  name             = "latest"
  description      = "Latest published version"
  function_name    = aws_lambda_function.default.arn
  function_version = aws_lambda_function.default.version
}
