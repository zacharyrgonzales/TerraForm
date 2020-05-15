#define variables
variable "iamname" {
  type = "string"
}

#create iam user once name is passed variable is passed in
resource "aws_iam_user" "newuser" {
  name = "${var.iamname}"
}

#create iam policy
resource "aws_iam_policy" "customiampolicy" {
  name = "customiampolicy"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "apigateway:DELETE",
                "apigateway:UpdateRestApiPolicy",
                "apigateway:SetWebACL",
                "apigateway:PUT",
                "apigateway:PATCH",
                "apigateway:POST",
                "apigateway:GET"
            ],
            "Resource": "*"
        }
    ]
}
    EOF
}

resource "aws_iam_policy_attachment" "policybind" {
  name       = "attachment"
  users      = ["${aws_iam_user.newuser.name}"]
  policy_arn = "${aws_iam_policy.customiampolicy.arn}"
}
