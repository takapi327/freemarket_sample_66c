class ApplicationController < ActionController::Base
  # basic認証のための記述
  before_action :basic_auth, if: :production?
  # 悪意のあるユーザーの入力に対してのセキュリティ対策
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:index, :show]
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  # 本番環境でのみ実行するための記述
  def production?
    Rails.env.production?
  end
  
  def basic_auth
    # ターミナルで設定した環境変数を使ってログインできるようにした。
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  protected

  def configure_permitted_parameters
    # サインアップ時に入力された「nickname」キーの内容の保存を許可しています
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
