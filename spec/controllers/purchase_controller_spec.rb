require 'rails_helper'

RSpec.describe PurchaseController, type: :controller do
  require 'users_controller'
  require 'products_controller'
  describe PurchaseController do

    describe "POST #pay" do
      let(:user) { FactoryBot.create(:user) }
      let(:params) {{user_id: user.id}}
    
      context 'log in' do
        before do
          @product = FactoryBot.create(:product)
          @card = FactoryBot.create(:card)
          user = @card.user
          login user
        end
        context 'can pay' do
          it "user can pay" do
            purchase_controller = PurchaseController.new
            post :pay, params: { id: @product }
            allow(purchase_controller).to receive(:pay).and_return(PayjpMock.prepare_valid_charge)
            expect(post :pay, params: { id: @product.id}).to redirect_to(done_path)
          end
        end
      end

      context 'not log in' do
        it 'redirects to new_user_session_path' do
          purchase_controller = PurchaseController.new
          post :pay, params: { id: @product }
          allow(purchase_controller).to receive(:pay).and_return(PayjpMock.prepare_valid_charge)
          expect(response).to redirect_to(new_user_session_path)
        end
      end

    end
  end
end