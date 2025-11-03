config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address: "smtp.resend.com",
  port: 465,
  domain: "2381.ca",
  user_name: "resend",
  password: Rails.application.credentials.dig(:resend, :api_key),
  authentication: :plain,
  enable_starttls_auto: true
}
