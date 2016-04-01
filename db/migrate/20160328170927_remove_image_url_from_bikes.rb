class RemoveImageUrlFromBikes < ActiveRecord::Migration
  def change
    remove_column :bikes, :image_url, :string
  end
end
