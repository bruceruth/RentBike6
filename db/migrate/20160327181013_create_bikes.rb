class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.decimal :price
      t.string :category
      t.string :subcategory

      t.timestamps null: false
    end
  end
end
