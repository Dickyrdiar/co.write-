class LikeController < ApplicationController
    def create 
        @user  = current_user.id 
        @post = params[:post_id]
        likes = {user_id: @user, post_id: @post}
        @likes = Like.new(likes)

        @like.save 
        if @like.save 
            redirect_to post_path(@post)
        else 
            redirect_to user_path
        end
    end
end
