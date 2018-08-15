class CommentController < ApplicationController

    def index
        @comment = Comment.all 
    end

    def create 
        @post = Post.find(params[:post_id])
        @comment = @post.commnets.create(params[:id].permit(:body))
        @comment.save 
        redirect_to post_path(@post)
    end 

end

