class RemoveEndHourFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :end_hour, :integer
  end
end
