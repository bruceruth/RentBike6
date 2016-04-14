class CreateBikesRentals < ActiveRecord::Migration
  def change
    create_table :bikes_rentals do |t|
      t.integer :bikes_id, :null => false
      t.integer :rentals_id, :null => false

      t.timestamps null: false
    end
  end
end
