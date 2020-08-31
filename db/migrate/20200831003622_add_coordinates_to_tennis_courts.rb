class AddCoordinatesToTennisCourts < ActiveRecord::Migration[6.0]
  def change
    add_column :tennis_courts, :latitude, :float
    add_column :tennis_courts, :longitude, :float
  end
end
