class AddBikeTypeToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :bike_type, :string
  end
end
