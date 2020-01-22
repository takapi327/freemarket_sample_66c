class ProductsController < ApplicationController

  def index
    @products = Product.includes(:user).order('created_at DESC').limit(10)
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def buy
    @product = Product.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:name, :content, :status, :burden, :day, :price, :derivery, images_attributes: [:image], areas_attributes: [:name], categories_attributes: [:name]).merge(user_id: current_user.id)
  end
  
end
