class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find(prams[:id])
    @posts = Post.tagged_with(@tag.name)
  end
end
