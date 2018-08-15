class UserController < ApplicationController
  
  def index
    @user = current_user 
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.create( user_params ) 
  end

  private 

  def user_params 
    params.require(user).permit(:avatar)
  end
end
