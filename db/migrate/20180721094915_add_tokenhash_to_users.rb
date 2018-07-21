class AddTokenhashToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :tokenhash, :string
    add_index :users, :tokenhash, unique: true
  end
end
