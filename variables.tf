# The function_name and runtime use variables to facilitate testing of
# both new runtimes and new function versions.
# End users will ordinarily use the default values.

variable "function_name" {
  description = "Name of the lambda function and role to be deployed"
  default     = "cloudfront-directory-index"
}

variable "runtime" {
  description = "Lambda function's runtime environment"
  default     = "nodejs8.10"
}
