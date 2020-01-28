#reCAPTCHAを利用するための環境変数をアプリで読み込むための記述
Recaptcha.configure do |config|
  config.site_key = Rails.application.credentials.recaptcha[:recaptcha_site_key]
  config.secret_key = Rails.application.credentials.recaptcha[:recaptcha_secret_key]
end