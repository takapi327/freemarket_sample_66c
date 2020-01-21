class ProductsController < ApplicationController

  def index
    @products = Product.includes(:user).order('created_at DESC').limit(10)
    @product = Product.new
  end

  def new
    @product = Product.new
    @product.images.new
    @product.areas.new
    @product.categories.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to root_path
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.user_id == current_user.id && @product.destroy
      redirect_to root_path
    else
      alert('削除できませんでした。')
    end
    
  end

  private
  def product_params
    params.require(:product).permit(:name, :content, :status, :burden, :day, :price, :derivery, images_attributes: [:image], areas_attributes: [:name], categories_attributes: [:name]).merge(user_id: current_user.id)
  end

end
