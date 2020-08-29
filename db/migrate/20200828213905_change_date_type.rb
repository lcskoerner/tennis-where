class ChangeDateType < ActiveRecord::Migration[6.0]
  def change
    change_column :bookings, :date, :string
  end
end
