class PurchaseController < ApplicationController
  require 'payjp'

  def index
    @product = Product.find(params[:id])
    card = Card.where(user_id: current_user.id).first
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = "sk_test_cf62dd25d74a63a633cea0bf"
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    product = Product.find(params[:id])
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = "sk_test_cf62dd25d74a63a633cea0bf"
    Payjp::Charge.create(
    :amount => 1000, #支払金額を入力(productテーブルから引っ張ってくる)
    :customer => card.customer_id, #顧客ID
    :currency => 'jpy', #日本円
  )
    Product.update(buyer_id: current_user.id)
    redirect_to action: 'done' #完了画面に移動
  end

  def done
    @product = Product.find(params[:id])
  end
end
