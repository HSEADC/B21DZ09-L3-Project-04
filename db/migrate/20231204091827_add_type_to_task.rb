class AddTypeToTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :type, :string
  end
end
