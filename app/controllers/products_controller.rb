class ProductsController < ApplicationController

  def index
    @products = Product.limit(10).includes(:user).order('created_at DESC')
  end

  def show
    @product = Product.find(params[:id])
  end

end
