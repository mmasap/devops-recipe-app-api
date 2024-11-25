output "cd_user_access_key_id" {
  description = "AWS key ID for CD user"
  value       = aws_iam_access_key.cd.id
}

output "cd_user_access_key_secret" {
  description = "AWS secret key for CD user"
  value       = aws_iam_access_key.cd.secret
  sensitive   = true
}
