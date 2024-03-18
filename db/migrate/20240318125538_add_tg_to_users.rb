class AddTgToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :tg, :string
  end
end
