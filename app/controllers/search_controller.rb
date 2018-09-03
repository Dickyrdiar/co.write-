class SearchController < ApplicationController
    def index
        @post = Post.search do 
            fulltext params[:search]
        end 
        
        @posts = @post.result
    end
end
