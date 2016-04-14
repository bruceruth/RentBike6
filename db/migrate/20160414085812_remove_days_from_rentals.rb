class RemoveDaysFromRentals < ActiveRecord::Migration
  def change
    remove_column :rentals, :days, :integer
  end
end
