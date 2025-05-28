data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

resource "aws_s3_bucket" "test_bucket" {
  bucket = var.bucket_name
  tags = {
    Name        = "My_bucket"
    Environment = "Dev"
  }

  /* lifecycle {
    #create_before_destroy = true  
    #prevent_destroy = true
    #ignore_changes = [
    #  tags,
    #]
    replace_triggered_by = [
      aws_instance.webserver.ami
    ]
  } */
}

resource "aws_instance" "webserver" {
  ami           = var.image_id
  instance_type = "t3.micro"

  /* tags = {
    Name      = "my_first_vm"
    Workspace = terraform.workspace
  } */
}


resource "aws_instance" "this" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  root_block_device {
    encrypted = true
  }

  dynamic "ebs_block_device" {
    for_each = var.ebs_block_devices
    iterator = device
    content {
      device_name = device.value["device_name"]
      encrypted   = device.value["encrypted"]
      volume_size = device.value["volume_size"]
    }
  }

  tags = {
    Name       = "Terraform-Instance"
    Env        = "Dev"
    Plataforma = data.aws_ami.ubuntu.platform_details
  }
}

resource "aws_instance" "webserver" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  root_block_device {
    encrypted = true
  }

  dynamic "ebs_block_device" {
    for_each = var.ebs_block_devices
    iterator = device
    content {
      device_name = device.value["device_name"]
      encrypted   = device.value["encrypted"]
      volume_size = device.value["volume_size"]
    }
  }

  tags = {
    Name       = "My EBS Block"
    Env        = "Dev"
    Plataforma = data.aws_ami.ubuntu.platform_details
  }
}
/* # create bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
  tags = {
    Name        = "My_bucket"
    Environment = "Dev"
  }

  lifecycle {
    #create_before_destroy = true  
    #prevent_destroy = true
    #ignore_changes = [
    #  tags,
    #]
    replace_triggered_by = [ 
      aws_instance.webserver.ami
     ]
    }
} */

# Imported resource
/* import {
  to = aws_instance.web
  id = "i-a9eb0d26f3620e6cf"
}

resource "aws_instance" "web" {
  ami =  "ami-0c55b5a45e530f9ec"
  instance_type = "t2.micro"
}


import {
  to = aws_s3_bucket.import-test
  id = "import-test"
}

resource "aws_s3_bucket" "import-test" {
  bucket              = "import-test"
}
 */
