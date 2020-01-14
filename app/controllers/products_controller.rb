class ProductsController < ApplicationController

  def index
    @product = Product.new
  end
end
