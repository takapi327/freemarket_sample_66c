require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe ProductsController do
    let(:user) { create(:user) }
  #   describe 'GET #new' do
  #     before do
  #       user = FactoryBot.create(:user)
  #       login user
  #     end
      
  #     it 'renders the :new template'do
  #       get :new
  #       expect(response).to render_template :new
  #     end
  #   end

  # end
  # describe '#create' do
  #   let(:user) { FactoryBot.create(:user) }
  #   let(:params) {{user_id: user, product: attributes_for(:product)}}

  #   context 'log in' do
  #     before do
  #       user = FactoryBot.create(:user)
  #       product = attributes_for(:product)
  #       login user
  #     end

  #     context 'can save' do
  #       it 'count up product' do
  #         expect{post :create, params: params}.to change(Product, :count).by(1)
  #       end

  #       it 'redirect to index' do
  #         get :index
  #         expect(response).to render_template :index
  #       end
  #     end

  #     context 'can not save' do
  #       let(:user) { create(:user) }
  #       let(:invalid_params){{user_id: user, product: attributes_for(:product, name: nil, content: nil, status: nil, burden: nil, day: nil, price: nil, derivery: nil, image: nil, category: nil)}}

  #       subject{
  #         post :create,
  #         params: invalid_params
  #       }

  #       it 'dose not count up' do
  #         expect{subject}.not_to change(Product, :count)
  #       end

  #       it 'renders index' do
  #         get :index
  #         expect(response).to render_template :index
  #       end
  #     end
  #   end

  #   context 'not log in' do
  #     it 'redirects to new_user_session_path' do
  #       post :create, params: params
  #       expect(response).to redirect_to(new_user_session_path)
  #     end
  #   end
  # end
  # describe "GET index" do
  #   before do
  #     user = FactoryBot.create(:user)
  #     login user
  #   end
  #   it 'populates an array of products ordered by created_at DESC' do
  #     products = create_list(:product, 3) 
  #     get :index
  #     expect(assigns(:products)).to match(products.sort{ |a, b| b.created_at <=> a.created_at } )
  #   end

  #   it "renders the :index template" do
  #     get :index
  #     expect(response).to render_template :index
  #   end
  # end
  # describe "destroy" do
  #   let(:user) { FactoryBot.create(:user) }
  #   let(:params) {{user_id: user.id}}
  #   context 'log in' do
  #     before do
  #       @product = FactoryBot.create(:product)
  #       user = @product.user
  #       login user
  #     end
  #     context 'can delete' do 
  #       it 'product destroy' do
  #         expect{delete :destroy, params: { id: @product.id }}.to change(Product, :count).by(-1)
  #       end
  #     end
  #   end
  # end

  # describe "GET #show" do
  #   context 'create product' do
  #     before do
  #       @product = FactoryBot.create(:product)
  #     end
  #     it "assigns the requested product to @product" do
  #       product = create(:product)
  #       get :show, params: { id: product }
  #       expect(assigns(:product)).to eq product
  #     end

  #     it "renders the :show template" do
  #       get :show, params: { id: @product }
  #       expect(response).to render_template :show
  #     end
  #   end
  # end

  # describe "#update" do
  #   let(:user) { FactoryBot.create(:user) }
  #   # let(:params) {{user_id: user, product: attributes_for(:product)}}
  #   before do
  #     binding.pry
  #     @user = FactoryBot.create(:user)
  #     # @product = FactoryBot.create(:product, name: 'tomi')
  #     @product = attributes_for(:product, owner: @user, name: 'tomi')
  #     login @user
  #   end

  #   it 'can updata' do
  #     product_params = FactoryBot.attributes_for(:product, name: "takapi")
  #     patch :update, params: { id: @product.id, product: product_params }
  #     expect(@product.reload.name).to eq "takapi"
  #   end

  # ここから練習
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
      let(:product) {{user_id: user.id, seller_id: user.id, product: attributes_for(:product), image: attributes_for(:image)}}
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
    
  end
end
