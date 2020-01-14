class UsersController < ApplicationController

  def index
    @products = Product.all
    @product = Product.new
    @users = User.all
    @user = User.new
  end

end
