#reCAPTCHAを利用するための環境変数をアプリで読み込むための記述
Recaptcha.configure do |config|
  config.site_key = ENV['RECAPTCHA_SITE_KEY']
  config.secret_key = ENV['RECAPTCHA_SECRET_KEY']
end