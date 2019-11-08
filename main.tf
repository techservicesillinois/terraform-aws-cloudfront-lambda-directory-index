locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.name
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
