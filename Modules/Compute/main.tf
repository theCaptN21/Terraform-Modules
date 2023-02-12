resource "aws_instance" "app_server" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"

  user_data = <<EOF
#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd 
systemctl enable httpd
echo "<h1>Welcome to Terraform With The Blue Team!</h1>" > /var/www/html/index.html
EOF

  tags = {
    Name = "SampleServerInstance"
  }
}

