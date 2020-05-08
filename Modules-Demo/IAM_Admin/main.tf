variable "iamname" {
    type = "string"
}

resource "aws_iam_user" "lb" {
  name = "${var.iamname}"
}

resource "aws_iam_access_key" "lb" {
  user = "${aws_iam_user.lb.name}"
}

resource "aws_iam_user_policy" "lb_ro" {
  name = "customadminpolicy"
  user = "${aws_iam_user.lb.name}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
  EOF
}





