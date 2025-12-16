resource "aws_instance" "main" {
  count                       = var.ec2_count
  ami                         = data.aws_ami.amazon_linux_2.id
  associate_public_ip_address = var.public_ip
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.*.id[count.index]
  vpc_security_group_ids      = [aws_security_group.web.id]
  key_name                    = var.key_name
  user_data = file("./scripts/httpd.sh")
  user_data_replace_on_change = true
  tags = {
    Name = "WEBSERVER[count.index]"
  }
}
