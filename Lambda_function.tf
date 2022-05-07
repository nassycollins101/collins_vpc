# Variables
variable "myregion" {}

variable "accountId" {}

# API Gateway
resource "aws_api_gateway_rest_api" "collinsnassy_api" {
  name = "collinsnassy__api"
}

resource "aws_api_gateway_resource" "collins_resource" {
  path_part   = "resource"
  parent_id   = aws_api_gateway_rest_api.collinsnassy_api.root_resource_id
  rest_api_id = aws_api_gateway_rest_api.collinsnassy_api.id
}

resource "aws_api_gateway_method" "collins_method" {
  rest_api_id   = aws_api_gateway_rest_api.collinsnassy_api.id
  resource_id   = aws_api_gateway_resource.collins_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "collinsnassy_integration" {
  rest_api_id             = aws_api_gateway_rest_api.collinsnassy_api.id
  resource_id             = aws_api_gateway_resource.collins_resource.id
  http_method             = aws_api_gateway_method.collins_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.lambda.invoke_arn
}

# Lambda
resource "aws_lambda_permission" "collins_apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal     = "apigateway.amazonaws.com"

  # More: http://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-control-access-using-iam-policies-to-invoke-api.html
  source_arn = "arn:aws:execute-api:${var.us-east-1}:${var.274904338303}:${aws_api_gateway_rest_api.collinsnassy_api.id}/*/${aws_api_gateway_method.collins_method.http_method}${aws_api_gateway_resource.collins_resource.path}"
}

resource "aws_lambda_function" "collins_lambda" {
  filename      = "lambda.zip"
  function_name = "mylambda"
  role          = aws_iam_role.collins_iam_role.arn
  handler       = "lambda.lambda_handler"
  runtime       = "python3.6"

  source_code_hash = filebase64sha256("lambda.zip")
}

# IAM
resource "aws_iam_role" "collins_iam_role" {
  name = "myrole"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}