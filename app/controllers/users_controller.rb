class UsersController < ApplicationController

  def index
    @products = Product.all
    @product = Product.new
    @users = User.all
    @user = User.new
  end

  def show
  end

  def edit
  end
  
end
