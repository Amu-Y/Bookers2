class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page]).reverse_order
  end
  
  def index
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
  end


  
end
