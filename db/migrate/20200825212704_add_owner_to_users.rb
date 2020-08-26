class AddOwnerToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :owner, :boolean, default: false, null: false
  end
end
