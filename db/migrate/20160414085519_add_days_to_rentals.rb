class AddDaysToRentals < ActiveRecord::Migration
  def change
    add_column :rentals, :days, :integer
  end
end
