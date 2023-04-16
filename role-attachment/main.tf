resource "aws_iam_instance_profile" "demo-profile" {
  name = "demo_profile"
  role = "test_role"
}

