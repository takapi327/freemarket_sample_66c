class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # SNS認証時に呼ばれるコールバック関数名が決まっているのでfacebook、google_oauth2というアクションから目的の処理authorizationを呼ぶ
  def facebook
    authorization
  end

  def google_oauth2
    authorization
  end

  def failure
    redirect_to root_path
  end

  private

  def authorization
    #APIから受け取ったレスポンスがrequest.env["omniauth.auth"]という変数に入る
    sns_info = User.from_omniauth(request.env["omniauth.auth"])
    @user = sns_info[:user]

    if @user.persisted? #ユーザー情報が登録済みなので、新規登録ではなくログイン処理を行う
      sign_in_and_redirect @user, event: :authentication 
    else
      @sns_id = sns_info[:sns].id #ユーザー情報が未登録なので、新規登録画面へ遷移する
      render template: 'devise/registrations/new'
    end
  end
end