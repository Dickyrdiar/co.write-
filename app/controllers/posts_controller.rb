class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :like]
  before_action :authenticate_user!, except: [:post, :index]
 

  # GET /posts
  # GET /posts.json
  def index
    @search = Post.search do 
      fulltext params[:search] 
      paginate(page: params[:page])
    end

    @posts = @search.results

    @tags = ActsAsTaggableOn::Tag.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comment = Comment.all
    
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post = current_user.posts.build
  end

  # User_list 

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #add category on post 

  def add_category 
    @post = Post.find(params[:id])
    @post.categories << Category.find(params[category_id])
  end

  def taggged 
    if params[:tag].present? 
      @post = Post.tagged_with(params[:tag])
    else 
      @post = Post.all 
    end
  end
  
  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :text, :image, :user_id, :tag_list)
    end
end
