class CreateLike < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.boolean :like 
      t.references :likeable, polymorphic: true 
      t.integer :user_id 
      t.timestamps
    end
  end

  def down 
    drop_table :likes 
  end
end
