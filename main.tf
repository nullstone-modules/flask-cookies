/*
 * NOTE: random_password uses a cryptographic random number generator
 * This is identical to how rails SecureRandom.hex works for generating secret_key_base
 * We use random_password instead of random_string or random_id since the result is marked sensitive
 *   and not exposed through console output
*/
resource "random_password" "secret_key" {
  // Equivalent to os.urandom(64) in python, 64 hex characters
  length = 64

  // Configure to generate only hex characters
  special          = true
  override_special = "abcdef"
  upper            = false
  lower            = false
  number           = true
}

output "secrets" {
  value = [
    {
      name  = "SECRET_KEY"
      value = random_password.secret_key.result
    }
  ]

  description = "list(object({ name: string, value: string })) ||| A list of secrets to inject into the app."
  sensitive   = true
}
