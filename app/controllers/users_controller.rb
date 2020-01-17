class UsersController < ApplicationController

  def index
    @products = Product.all
    @product = Product.new
    @users = User.all
    @user = User.new
  end

  def show
    @products = Product.all
    @product = Product.new
    @user = User.find(params[:id])
  end

  def edit
    @products = Product.all
    @product = Product.new
    @users = User.all
    @user = User.new
  end

  def logout
    @product = Product.new
  end

  def cardregister
    @product = Product.new
  end

  private
  def user_params
    params.require(:user).permit(:id, :nickname, :email).merge(user_id: current_user.id)
  end

end
