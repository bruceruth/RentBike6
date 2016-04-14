class DropBikesRentalsTable < ActiveRecord::Migration
  def change
        drop_table :bikes_rentals

  end
end
