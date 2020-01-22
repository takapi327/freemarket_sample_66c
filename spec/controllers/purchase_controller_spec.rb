require 'rails_helper'

RSpec.describe PurchaseController, type: :controller do
  require 'users_controller'
  require 'products_controller'
  describe PurchaseController do

      describe "POST #pay" do
      let(:user) { FactoryBot.create(:user) }
      let(:params) {{user_id: user.id}}
      # let(:) {{user_id: user.id}}

      context 'log in' do
        before do
          # binding.pry
          @product = FactoryBot.create(:product)
          # @user = FactoryBot.create(:user)
          @card = FactoryBot.create(:card)
          # user = @product.user
          user = @card.user
          # user = user.card.user
          login user
        end
        
          context 'can pay' do
            it "ユーザーが支払う" do
              # binding.pry
              purchase_controller = PurchaseController.new
              post :pay, params: { id: @product }
              allow(purchase_controller).to receive(:pay).and_return(PayjpMock.prepare_valid_charge)
              expect(post :pay, params: { id: @product.id}).to redirect_to(done_path)
            end
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
