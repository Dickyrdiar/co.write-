class CategoryController < ApplicationController
  def index
    @category = nil
    @categories = Category.find(:all, :conditions => { :parent_id => nil})
  end

  def show
    #find the category belonging to the given id 
    @category = Category.find(parmas[:id])
    #gran all sub-categories
    @categories = @category.subcategories
    render :action => :index
  end

  def new 
    @category = Category.new 
    @category.parent = Category.find(params[:id]) unless params[:id].nil?
  end
end
