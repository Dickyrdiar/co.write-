class UserController < ApplicationController

  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts
  end

  def search 
    @user  = User.search(params[:search])
  end

  def self.seacrh(user_name)
    if user_name 
      user_name.downcase!
      where('LOWER(name) LIKE ? ', "%#{user_name}%")
    else 
      all 
    end
  end

  private 

  def user_params 
    params.require(user).permit(:avatar)
  end
end
