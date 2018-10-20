class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories_posts, :id => false do |t|
      t.integer :category_id 
      t.integer :post_id
      t.timestamps
    end
  end
end
