class ApplicationController < ActionController::Base
  # 悪意のあるユーザーの入力に対してのセキュリティ対策
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # サインアップ時に入力された「nickname」キーの内容の保存を許可しています
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
