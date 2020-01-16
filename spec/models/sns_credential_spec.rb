require 'rails_helper'

RSpec.feature 'SNS sign_in, sign_up' do

  describe 'facebookと連携して新規登録' do
    it "連携したユーザでなければ新規登録" do
      OmniAuth.config.mock_auth[:facebook] = nil
      Rails.application.env_config['omniauth.auth'] = facebook_mock
      #サインアップページを開く
      visit  new_user_registration_path
      #Googleで登録をクリック
      click_link 'Facebookで登録'
      #フォームにパスワードを入力
      fill_in 'user_password', with: '12345678'
      fill_in 'user_password_confirmation', with: '12345678'
      expect{
        #sign_upボタンをクリック
        click_button 'Sign up'
      }.to change(User, :count).by(1)
    end
    it '連携したユーザだとログイン' do
      user = FactoryBot.build(:user)
      visit new_user_session_path
      expect{
        click_link "Facebookでログイン"
      }.not_to change(User, :count)
    end
  end
end
