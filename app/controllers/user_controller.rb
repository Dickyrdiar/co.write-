class UserController < ApplicationController

  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts
  end

  private 

  def set_post 
    @post = Post.find(params[:id])
  end

  def user_params 
    params.require(user).permit(:avatar)
  end
end
