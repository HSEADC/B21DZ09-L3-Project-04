class RemoveNameFromTasks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :name, :string
  end
end
