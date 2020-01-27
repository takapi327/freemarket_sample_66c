class CardsController < ApplicationController
  require "payjp"
  # after_action :tobu, only: [:new]

  def new
    card = Card.where(user_id: current_user.id)
    # path = Rails.application.routes.recognize_path(request.referer)
    # @product = Product.find(params[:id])
  end

  def make #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = Rails.application.credentials.payjp[:payjp_secret_key]
    @product = Product.find(params[:product_id])
    if params['payjp-token'].blank?
       redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト', #なくてもOK
      email: current_user.email, #なくてもOK
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      @card.save
      # redirect_to @card
      redirect_to buy_product_path(@product)
    end
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    @card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = Rails.application.credentials.payjp[:payjp_secret_key]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def delete #PayjpとCardデータベースを削除します
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = Rails.application.credentials.payjp[:payjp_secret_key]

      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end
end
