class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :Name
      t.text :Photo
      t.text :Bio
      t.integer :PostCounter

      t.timestamps
    end
  end
end
