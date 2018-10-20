class CategoryController < ApplicationController
    def show  
        @categories = Category.find(params[:id])
        @category.posts = @category_post
    end
    
end
