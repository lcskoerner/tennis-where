class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :date
      t.integer :start_hour
      t.integer :end_hour
      t.integer :number_of_hour
      t.references :user, null: false, foreign_key: true
      t.references :tennis_court, null: false, foreign_key: true

      t.timestamps
    end
  end
end
