class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :Title
      t.text :Text
      t.integer :LikesCounter
      t.integer :CommentsCounter
      t.integer :author_id

      t.timestamps
    end
    add_index :posts, :author_id
  end
end
