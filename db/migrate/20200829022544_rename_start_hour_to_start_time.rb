class RenameStartHourToStartTime < ActiveRecord::Migration[6.0]
  def change
    rename_column :bookings, :start_hour, :start_time
  end
end
