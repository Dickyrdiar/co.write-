class Category < ApplicationRecord
    has_ancestry

    has_and_belongs_to_many :posts
    has_many :subcategories, :class_name => "Category", :foreign_key => "parent_di", :dependent => :destroy
    belongs_to :parent_category, :class_name => "Category"
end
