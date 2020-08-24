  class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :role
      t.string :first_name
      t.string :last_name
      t.text :address
      t.integer :phone_number

      t.timestamps
    end
  end
end
