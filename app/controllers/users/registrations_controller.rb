# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  prepend_before_action :check_captcha, only: [:create] 

  # GET /resource/sign_up
  def new
    @user = User.new
  end

  # POST /resource
  def create
    if params[:sns_auth] == 'true' #SNS認証でのサインアップの際はパスワードの入力を不要にする記述
      pass = Devise.friendly_token
      params[:user][:password] = pass
      params[:user][:password_confirmation] = pass
    end
    
    @user = User.new(sign_up_params)
    unless @user.valid? #Userモデルのバリデーションチェック
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes} #ユーザーデータの入力情報をsessionで保持
    session["devise.regist_data"][:user]["password"] = params[:user][:password] #attributesで整型できないパスワード情報を保持させる
    @user_detail = @user.build_user_detail #ユーザーとユーザー詳細情報を紐付ける記述
    @address = @user.build_address #ユーザーと住所を紐づける記述
    render :new_cellphone #次頁であるSMS送信画面を呼び出す記述
  end

  def create_tel
    @user = User.new(session["devise.regist_data"]["user"]) #sessionに保持させている情報を@userに代入
    @user_detail = UserDetail.new(user_detail_params)
    unless @user_detail.tel.present? #電話番号が入力されないと次へ進ませないための記述
      render :new_cellphone and return
    end
    session["devise.regist_tel"] = user_detail_params[:tel] #入力した電話番号情報を保持させるための記述
    @user_detail = @user.build_user_detail
    @address = @user.build_address
    render :new_address #次頁の住所入力フォームを呼び出す記述
  end
  
  def create_address
    @user = User.new(session["devise.regist_data"]["user"]) #sessionに保持させている情報を@userに代入
    @user.build_user_detail(user_detail_params)
    @user.user_detail.tel = session["devise.regist_tel"] #sessionに保持させている電話番号情報をユーザー詳細情報に追加する記述
    @user.build_address(address_params)
    unless @user.address.valid? #Addressesモデルのバリデーションチェック
      render :new_address and return
    end
    @user.save
    sign_in(:user, @user) #サインインした状態にする記述
    redirect_to root_path
  end

  def complete_registration
  end
  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private
  def check_captcha
    unless verify_recaptcha
      self.resource = resource_class.new sign_up_params
      resource.validate
      set_minimum_password_length
      respond_with_navigational(resource) { render :new }
    end 
  end

  

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  def user_detail_params
    params.require(:user_detail).permit(:last_name, :first_name, :last_kana_name, :first_kana_name, :tel)
  end

  def address_params
    params.require(:user_detail).require(:address).permit(:zip, :prefectures, :city, :number, :bill, :landline)
  end
end