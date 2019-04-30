data "aws_iam_role" "selected" {
  name = "lambda-edge-basic"
}

locals {
  lambda_zip_path = "${path.module}/cloudfront_directory_index.zip"
}

resource "aws_lambda_function" "default" {
  function_name = "cloudfront-directory-index"
  description   = "Serve directory index.html files for Cloudfront"
  handler       = "cloudfront_directory_index.handler"
  publish       = "true"

  role    = "${data.aws_iam_role.selected.arn}"
  runtime = "nodejs6.10"

  filename         = "${local.lambda_zip_path}"
  source_code_hash = "${base64sha256(file("${local.lambda_zip_path}"))}"
}

output "qualified_arn" {
  value = "${aws_lambda_function.default.qualified_arn}"
}

output "version" {
  value = "${aws_lambda_function.default.version}"
}
