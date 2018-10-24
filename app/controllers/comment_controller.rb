class CommentController < ApplicationController

    def new 
        @comments = Comment
    end

    def show 
        @comment = Comment.find(params[:id])
    end

    def create 
        @post = Post.find(params[:post_id])
        @comment = @post.commnets.create(params[:post_id].permit(:body))
        @comment.save 
        redirect_to comments_path
    end
    
    def delete 
    end

    def comments_params 
        params.reqiure(:comment).permit(:body)
    end
end

