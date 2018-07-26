class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :address, :text
    add_column :users, :cell, :text
  end
end
