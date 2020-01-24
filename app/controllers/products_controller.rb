class ProductsController < ApplicationController

  def index
    @products = Product.includes(:user).order('created_at DESC').limit(10)
    @product = Product.new
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to root_path
  end
  
  def show
    @product = Product.find(params[:id])
  end


  def buy
    @product = Product.find(params[:id])
  end
  

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to root_path
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
    params.require(:product).permit(:name, :content, :status_id, :burden_id, :day_id, :price, :derivery, :area_id, :category_id, images_attributes: [:image]).merge(user_id: current_user.id)
  end
  

end

