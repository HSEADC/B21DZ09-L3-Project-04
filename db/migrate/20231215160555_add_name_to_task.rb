class AddNameToTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :name, :string
  end
end
