class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :phone
      t.string :code
      t.string :country
      t.string :hourse_number
      t.timestamps
    end
  end
end
