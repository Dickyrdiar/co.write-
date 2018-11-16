class CommentController < ApplicationController
    def create 
        @post = Post.find(params[:id])
        @comment = @post.comments.create(params[:id].permit[:body] 
        @comment.save 
        redirect_to post_path(@post)
    end
        
    def destroy 
        @comment = Comment.find(params[:id]) 
        @comment.destroy 
        redirect_to post_path(@post)
    end
end

