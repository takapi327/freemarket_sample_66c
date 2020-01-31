class CardsController < ApplicationController
  require "payjp"

  def new
  end

  def make #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = Rails.application.credentials.payjp[:payjp_secret_key]
    if params['payjp-token'].blank?
       redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト', #なくてもOK
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card) #user_idとcustomer_idとcard_idを持ったCard.newを変数に代入。
      @card.save #保存
      redirect_to @card #詳細画面へリダイレクト
    end
  end

  def show #Cardのデータをpayjpに送り情報を取り出します
    @card = Card.where(user_id: current_user.id).first #テーブルからpayjpの顧客ID(アクセスキー)を検索
    if @card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = Rails.application.credentials.payjp[:payjp_secret_key]
      customer = Payjp::Customer.retrieve(@card.customer_id) #保管した顧客ID（アクセスキー）でpayjpから情報取得
      @default_card_information = customer.cards.retrieve(@card.card_id) #保管したカードIDでpayjpからカード情報取得、カード情報表示のためインスタンス変数に代入
    end
  end

  def delete #PayjpとCardデータベースを削除します
    card = Card.where(user_id: current_user.id).first #テーブルからpayjpの顧客ID(アクセスキー)を検索
    if card.blank?
    else
      Payjp.api_key = Rails.application.credentials.payjp[:payjp_secret_key]

      customer = Payjp::Customer.retrieve(card.customer_id) #保管した顧客ID（アクセスキー）でpayjpから情報取得
      customer.delete #payjp側の顧客情報を削除
      card.delete #DBのカード情報(payjpへのアクセスキー)を削除
    end
      redirect_to action: "new"
  end
end
