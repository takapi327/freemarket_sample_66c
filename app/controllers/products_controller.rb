class ProductsController < ApplicationController

  def index
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    # binding.pry
    @product = Product.new(product_params)
    # @product.user_id = FactoryBot.create(:user)
    @product.user_id = current_user.id
    @product.save
    redirect_to new_user_session_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :content, :status, :burden, :day, :price, :derivery, images_attributes: [:image]).merge(user_id: current_user.id)
  end
end