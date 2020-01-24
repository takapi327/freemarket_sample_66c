require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe ProductsController do

    describe 'GET #new' do
      before do
        user = FactoryBot.create(:user)
        login user
      end
      
      it 'renders the :new template'do
        get :new
        expect(response).to render_template :new
      end
    end

  end
  describe '#create' do
    let(:user) { FactoryBot.create(:user) }
    let(:category){ FactoryBot.create(:category) }
    let(:params) {{user_id: user, product: attributes_for(:product)}}

    context 'log in' do
      before do
        # binding.pry
        user = FactoryBot.create(:user)
        # category = FactoryBot.create(:category)
        product = attributes_for(:product)
        # category = @product.category_id
        login user
      end

      context 'can save' do
        it 'count up product' do
          # binding.pry
          expect{post :create, params: params}.to change(Product, :count).by(1)
        end

        it 'redirect to index' do
          get :index
          expect(response).to render_template :index
        end
      end

      context 'can not save' do
        let(:user) { create(:user) }
        let(:invalid_params){{user_id: user, product: attributes_for(:product, name: nil, content: nil, status: nil, burden: nil, day: nil, price: nil, derivery: nil, image: nil, category: nil)}}

        subject{
          post :create,
          params: invalid_params
        }

        it 'dose not count up' do
          expect{subject}.not_to change(Product, :count)
        end

        it 'renders index' do
          get :index
          expect(response).to render_template :index
        end
      end
    end

    context 'not log in' do
      it 'redirects to new_user_session_path' do
        post :create, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
  describe "GET index" do
    before do
      user = FactoryBot.create(:user)
      login user
    end
    it 'populates an array of products ordered by created_at DESC' do
      products = create_list(:product, 3) 
      get :index
      expect(assigns(:products)).to match(products.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
  describe "destroy" do
    let(:user) { FactoryBot.create(:user) }
    let(:params) {{user_id: user.id}}
    let(:category){ FactoryBot.create(:category) }
    context 'log in' do
      before do
        @product = FactoryBot.create(:product)
        user = @product.user
        login user
      end
      context 'can delete' do 
        it 'product destroy' do
          expect{delete :destroy, params: { id: @product.id }}.to change(Product, :count).by(-1)
        end
      end
    end
  end

  describe "GET #show" do
    let(:category){ FactoryBot.create(:category) }
    context 'create product' do
      before do
        @product = FactoryBot.create(:product)
      end
      it "assigns the requested product to @product" do
        product = create(:product)
        get :show, params: { id: product }
        expect(assigns(:product)).to eq product
      end

      it "renders the :show template" do
        get :show, params: { id: @product }
        expect(response).to render_template :show
      end
    end
  end

  describe "GET #edit" do
    let(:user) { FactoryBot.create(:user) }
    let(:category){ FactoryBot.create(:category) }
    let(:params) {{user_id: user, product: attributes_for(:product)}}
    context 'create product' do
      # binding.pry
      before do
        user = FactoryBot.create(:user)
        login user
      end

      it "assigns the requested product to @product" do
        product = create(:product)
        get :edit, params: { id: product }
        expect(assigns(:product)).to eq product
      end

      it "renders the :edit template" do
        product = create(:product)
        get :edit, params: { id: product }
        expect(response).to render_template :edit
      end
    end
  end
end
