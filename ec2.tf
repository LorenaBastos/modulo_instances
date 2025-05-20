resource "aws_instance" "webserver" {
  ami           = var.image_id
  instance_type = "t3.micro"

  tags = {
    Name      = "my_first_vm"
    Workspace = terraform.workspace
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
