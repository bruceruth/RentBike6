class AddRentalIdToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :rental_id, :integer
    add_reference :bikes, :rentals, index: true
  end
end
