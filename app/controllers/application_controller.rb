class ApplicationController < ActionController::Base
  # basic認証のための記述
  before_action :basic_auth
  # 悪意のあるユーザーの入力に対してのセキュリティ対策
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  
  def basic_auth
    #ユーザー名とパスワードでBasic認証ができるように設定しています。
    authenticate_or_request_with_http_basic do |username, password|
      username == '66_mercari_c' && password == '66c'
    end
  end

  protected

  def configure_permitted_parameters
    # サインアップ時に入力された「nickname」キーの内容の保存を許可しています
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
