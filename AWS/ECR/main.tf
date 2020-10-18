resource "aws_ecr_repository" "registery" {
  name                 = var.REGISTERY_NAME
  image_tag_mutability = var.MUTABILITY

  image_scanning_configuration {
    scan_on_push = var.SCAN
  }
  tags = var.TAGS
}