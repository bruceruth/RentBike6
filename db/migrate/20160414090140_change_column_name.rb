class ChangeColumnName < ActiveRecord::Migration
  def change
        rename_column :rentals, :type, :biketype

  end
end
