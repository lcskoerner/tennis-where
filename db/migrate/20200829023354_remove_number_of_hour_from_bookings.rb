class RemoveNumberOfHourFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :number_of_hour, :integer
  end
end
