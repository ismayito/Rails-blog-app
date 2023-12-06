class AddUserRefToComments < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :comments, :users, column: :user_id
  end
end
