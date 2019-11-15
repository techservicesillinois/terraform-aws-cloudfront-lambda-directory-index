data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "archive_file" "selected" {
  type        = "zip"
  source_file = "${path.module}/index.js"
  output_path = "${path.module}/index.zip"
}

data "aws_iam_role" "selected" {
  name = var.iam_role_name
}
