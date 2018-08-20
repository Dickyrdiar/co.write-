class UserController < ApplicationController

  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts
  end

  private 

  def user_params 
    params.require(user).permit(:avatar)
  end
end
