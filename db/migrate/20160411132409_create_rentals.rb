class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.date :date
      t.string :type, :null => false
      t.integer :rentalDuration

      t.timestamps null: false
    end
  end
end
