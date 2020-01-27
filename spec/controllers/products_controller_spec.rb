require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe ProductsController do
    let(:user) { create(:user) }
    let(:product) {{user_id: user.id, seller_id: user.id, product: attributes_for(:product), image: attributes_for(:image)}}

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

    # NEWアクションがログインしていないと行えないかのテスト
    describe 'GET #new' do
      context 'can new action' do
        before do
          login user
        end
        # NEWアクションを行なった時に正しくページに推移するかのテスト
        it 'renders the :new template'do
          get :new
          expect(response).to render_template :new
        end
      end
    end

    # CREATEアクションのテスト
    describe 'POST #create' do
      context 'log in' do
        before do
          login user
        end
        # 保存ができた場合の処理
        context 'can create product' do
          it 'count up product' do
            expect{post :create, params: product}.to change(Product, :count).by(1)
          end
          subject{get :index}
          it{ expect(subject).to render_template :index }
        end
        # 保存できなかった場合の処理
        context 'can not create product' do
          let(:invalid_product){{user_id: user, product: attributes_for(:product, name: nil, content: nil, status_id: nil, burden_id: nil, day_id: nil, price: nil, derivery_id: nil, image: nil, category_id: nil)}}
          it 'count not up product' do
            expect{post :create, params: invalid_product}.to change(Product, :count).by(0)
          end
          subject{get :index}
          it{ expect(subject).to render_template :index }
        end
      end
    end

    # DESTROYアクションのテスト
    describe 'DELETE #destroy' do
      # ログインしている場合の処理
      context 'log in' do
        before do
          @product = create(:product)
          user = @product.user
          login user
        end
        # 削除できた場合の処理
        context 'can delete product' do
          it 'count down product' do
            expect{delete :destroy, params: { id: @product.id }}.to change(Product, :count).by(-1)
          end
        end
      end
      # ログインしていない場合
      context ' not log in' do
        before do
          @product = create(:product)
        end
        # 削除できない場合の処理
        context 'can not delete product' do
          it 'count not down product' do
            expect{delete :destroy, params: { id: @product.id }}.to change(Product, :count).by(0)
          end
          it 'new user session path' do
            delete :destroy, params: { id: @product.id }
            expect(response).to redirect_to(new_user_session_path)
          end
        end
      end
    end

    # SHOWアクションのテスト
    describe "GET #show" do
      # showアクションが動いた場合の処理
      context 'show product' do
        it "assigns the requested product to @product" do
          product = create(:product)
          get :show, params: { id: product }
          expect(assigns(:product)).to eq product
        end
        it "renders the :show template" do
          product = create(:product)
          get :show, params: { id: product }
          expect(response).to render_template :show
        end
      end
    end

  describe "GET #edit" do
    let(:user) { FactoryBot.create(:user) }
    let(:category){ FactoryBot.create(:category) }
    let(:params) {{user_id: user, product: attributes_for(:product)}}
    context 'create product' do
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

  describe "#update" do
    before do
      @product = create(:product)
      user = @product.user
      login user
    end
    context 'can updata' do
      it 'change name' do
        patch :update, params: { id: @product.id, product: attributes_for(:product, name: 'aki')}
        expect(@product.reload.name).to eq("aki")
      end
    end
  end
end
