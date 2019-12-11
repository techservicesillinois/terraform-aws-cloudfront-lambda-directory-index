data "aws_iam_role" "selected" {
  name = "${var.iam_role_name}"
}
