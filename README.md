# cloudfront-lambda-directory-index

[![Terraform actions status](https://github.com/techservicesillinois/terraform-aws-cloudfront-lambda-directory-index/workflows/terraform/badge.svg)](https://github.com/techservicesillinois/terraform-aws-cloudfront-lambda-directory-index/actions)

Provides a Lambda@Edge origin-request trigger function resource for
use with AWS CloudFront.  When used with CloudFront this function
will append `index.html` to requests ending in a slash `/`. A lambda
alias `latest` is also provided pointing to the most recently
published function version.

Argument Reference
-----------------

The following arguments are supported:

* `function_name` - (Optional) Name of the lambda function and role
to be deployed (Default cloudfront-directory-index).

* `runtime` - Lambda function's runtime environment.

* `iam_role_name` - (Optional) Lambda function's IAM role (Default
"lambda-edge-basic")

Attributes Reference
--------------------

The following attributes are exported:

* `qualified_arn` - The Amazon Resource Name (ARN) identifying the
Lambda Function Version.

Credits
--------------------

**Nota bene:** The vast majority of the verbiage on this page was
taken directly from the Terraform manual, and in a few cases from
Amazon's documentation.
