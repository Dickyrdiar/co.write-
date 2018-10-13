class LikePostController < ApplicationController
    def create 
        @user = current_user.di 
        @post = Post.find(params[:post_id])
        likes = { user_id: @user, post_id: @post }
        @like = Like.new(likes)

        @like.save! 
        if @like.save 
            redirect_to user_path(@user)
        else 
            redirect_to post_path 
        end
    end
end
