class CommentController < ApplicationController

    def index
        @comment = Comment.find(params[:id])
    end

    def create 
        @post = Post.find(params[:post_id])
        @comment = @post.commnets.create(params[:post_id].permit(:body))
        @comment.save 
        redirect_to post_comments(@post)
    end 

    def comments_params 
        params.reqiure(:comment).permit(:body)
    end
end

