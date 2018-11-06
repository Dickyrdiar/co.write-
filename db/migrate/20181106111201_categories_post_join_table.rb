class CategoriesPostJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :categories_post, :id => false do |t| 
      t.integer :category_id 
      t.integer :post_id
    end 
  end
end
