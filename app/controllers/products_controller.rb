class ProductsController < ApplicationController

  def index
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    @product = Product.new(product_params)
    # @product.user_id = current_user.id
    @product.user_id = FactoryBot.create(:user)
    if @product.save
    else
      redirect_to root_path
    end
  end

  private
  def product_params
    params.require(:product).permit(:user_id, :name, :content, :status, :burden, :day, :price, :derivery, images_attributes: [:image])
  end
end
