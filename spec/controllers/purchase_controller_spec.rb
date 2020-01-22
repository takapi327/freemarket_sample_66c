require 'rails_helper'

RSpec.describe PurchaseController, type: :controller do
  require 'users_controller'
  require 'products_controller'
  describe PurchaseController do

    # describe "GET #index" do
    #   it "購入確認画面を表示" do
    #     user = create(:user)
    #     products = create_list(:product, 3) 
    #     get :index
    #     expect(assigns(:products)).to match(products.sort{ |a, b| b.created_at <=> a.created_at } )
    #   end
    

    #   it "renders the :index template" do
    #     get :index
    #     expect(response).to render_template :index
    #   end
    # end

      describe "POST #pay" do
      let(:user) { FactoryBot.create(:user) }
      let(:params) {{user_id: user.id}}

      context 'log in' do
        before do
          @product = FactoryBot.create(:product)
          user = @product.user
          card = user.card
          login user
        end
      end

        # let(:user) { FactoryBot.create(:user) }
        # let(:params) {{user_id: user, product: attributes_for(:product)}}
        # let(:card) {{user_id: user, card: attributes_for(:card)}}

        # context 'log in' do
        #   before do
        #     user = FactoryBot.create(:user)
        #     product = attributes_for(:product)
        #     card = attributes_for(:card)
        #     login user
        #   end
        # end
        
        context 'can pay' do
          it "ユーザーが支払う" do
            post :pay
            payjp_charge = Payjp::Charge.new
            allow(payjp_charge).to receive(:pay).and_return(PayjpMock.prepare_valid_charge)
            expect{post :pay, params: params}.to change(Product, :buyer_id).by(1)
          end
        end
      end

      # describe "GET #done" do
      #   it "購入完了画面を表示させる" do
      #     get :done
      #     expect(response).to have_http_status(:success)
      #   end
      # end

  end
end
