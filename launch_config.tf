resource "aws_launch_template" "launch_template" {
  name                        = "launch_template"
  image_id                    = data.aws_ssm_parameter.instance_ami.value
  instance_type               = var.instance_type
  security_groups             = [aws_security_group.instance_sg.id]
  associate_public_ip_address = true
  user_data                   = file("userdata.sh")
  key_name                    = var.keyname
}