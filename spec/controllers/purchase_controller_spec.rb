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
            # binding.pry
            purchase_controller = PurchaseController.new
            post :pay, params: { id: @product }
            allow(purchase_controller).to receive(:pay).and_return(PayjpMock.prepare_valid_charge)
            expect(post :pay, params: { id: @product.id}).to redirect_to(done_path)
          end
        end
      end
    end
  end
end


# context 'log in,card:nil' do
      #   before do
      #     @product = FactoryBot.create(:product)
      #     @card  = Card.new(customer_id: nil, card_id: nil)
      #     user = @card.user
      #     login user
      #   end
      #     context 'can not pay' do
      #       it '支払えない' do
      #         # let(:invalid_params){{user_id: user, card: attributes_for(customer_id: nil, card_id: nil)}}
      #         @product = FactoryBot.create(:product)

      #         purchase_controller = PurchaseController.new
      #         post :pay, params: { id: @product }
      #         allow(purchase_controller).to receive(:pay).and_return(PayjpMock.prepare_valid_charge)
      #         expect(post :pay, params: { id: @product.id}).to redirect_to(done_path)
      #       end
      #     end
      #   end
      # end