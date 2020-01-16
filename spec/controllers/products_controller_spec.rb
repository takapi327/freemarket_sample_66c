require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe "GET index" do
    it 'populates an array of products ordered by created_at DESC' do
      user = create(:user)
      products = create_list(:product, 3) 
      get :index
      expect(assigns(:products)).to match(products.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end
