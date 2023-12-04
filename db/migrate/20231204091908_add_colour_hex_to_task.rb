class AddColourHexToTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :colour_hex, :string
  end
end
