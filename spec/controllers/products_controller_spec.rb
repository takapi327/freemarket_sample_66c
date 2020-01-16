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
    let(:params) {{user_id: user, product: attributes_for(:product)}}

    context 'log in' do
      before do
        user = FactoryBot.create(:user)
        login user
      end

      context 'can save' do
        # subject{
        #   post :create, params: params
        # }

        it 'count up product' do
          # binding.pry
          # product.create{product}
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
        # binding.pry
        post :create, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end