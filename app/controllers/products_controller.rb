class ProductsController < ApplicationController

  def index
    @products = Product.includes(:user).order('created_at DESC').limit(10)
  end

  def show
    @product = Product.find(params[:id])
  end

end
