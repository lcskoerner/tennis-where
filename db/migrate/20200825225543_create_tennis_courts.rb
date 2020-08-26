class CreateTennisCourts < ActiveRecord::Migration[6.0]
  def change
    create_table :tennis_courts do |t|
      t.string :name
      t.string :address
      t.integer :price_per_hour
      t.text :detail
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
