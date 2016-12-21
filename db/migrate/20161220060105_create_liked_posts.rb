class CreateLikedPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :liked_posts do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.references :liker

      t.timestamps
    end
  end
end
