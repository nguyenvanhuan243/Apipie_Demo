class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.string :text
      t.string :title
      t.string :type
      t.timestamps
    end
  end
end
