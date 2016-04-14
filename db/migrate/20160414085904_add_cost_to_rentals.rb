class AddCostToRentals < ActiveRecord::Migration
  def change
    add_column :rentals, :cost, :decimal
  end
end
