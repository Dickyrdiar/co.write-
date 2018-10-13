class CreateLikePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :like_posts do |t|

      t.timestamps
    end
  end
end
