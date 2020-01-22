require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  describe SearchesController do
    describe 'GET #search' do
      let(:params) {{product: attributes_for(:product)}}
      before do
        @product = FactoryBot.create(:product)
      end

      it 'can search' do
        expect{get :index, params: params}
      end

      it 'renders index' do
        get :index
        expect(response).to render_template :index
      end
    end
  end
end
