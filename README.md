# cloudfront-lambda-directory-index

[![Build Status](https://drone.techservices.illinois.edu/api/badges/techservicesillinois/terraform-aws-cloudfront-lambda-directory-index/status.svg)](https://drone.techservices.illinois.edu/techservicesillinois/terraform-aws-cloudfront-lambda-directory-index)

Provides a Lambda@Edge function resource for use with AWS CloudFront.
When used with CloudFront this function will append `index.html`
to requests ending in a slash `/`.

Argument Reference
-----------------

The following arguments are supported:

* `function_name` - (Optional) Name of the lambda function and role
to be deployed (Default cloudfront-directory-index).

* `runtime` - (Optional) Lambda function's runtime environment
(Default nodejs10.x).

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
