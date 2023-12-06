class AddPostRefToComments < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :comments, :posts, colunm: :post_id
  end
end
