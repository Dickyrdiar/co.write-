class CategoryController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    if params[:category_id]
      @categories = Category.find params[:category_id]
      @posts = @category.posts 
    else 
      @posts = Post.all
    end
  end
  
end
