# resource "aws_dynamodb_table" "dynamodb-table-state-lock" {
#   name           = "terraform-state-lock"
#   read_capacity  = 20
#   write_capacity = 20
#   hash_key       = "LockId"
#
#    attribute {
#     name = "LockId"
#     type = "S"
#   }
#
#   tags = {
#     Name        = "dynamodb-table-1"
#     Environment = "Dev"
#   }
# }