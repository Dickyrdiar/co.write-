class UserController < ApplicationController
  
  def index
    @user = current_user 
  end

  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts
  end

  def create
    @user = User.create( user_params ) 
  end

  private 

  def user_params 
    params.require(user).permit(:avatar)
  end
end
