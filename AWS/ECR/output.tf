output "arn" {
  description = "Full ARN of the repository"
  value = aws_ecr_repository.registery.arn
}
output "name" {
  description = "The name of the repository."
  value = aws_ecr_repository.registery.name
}

output "registry_id" {

  description = "The registry ID where the repository was created."
  value = aws_ecr_repository.registery.registry_id
}

output "repository_url" {
  description = "The URL of the repository (in the form `aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName`)"
  value = aws_ecr_repository.registery.repository_url

}