class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :address
      t.string :phone
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
