resource "aws_lambda_function" "default" {
  description      = "Serve directory index.html files for Cloudfront"
  function_name    = "${var.function_name}"
  runtime          = "${var.runtime}"
  handler          = "cloudfront_directory_index.handler"
  publish          = true
  role             = "${data.aws_iam_role.selected.arn}"
  filename         = "./index.zip"
  source_code_hash = "${base64sha256(file("./index.zip"))}"
}
