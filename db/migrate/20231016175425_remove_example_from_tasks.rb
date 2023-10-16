class RemoveExampleFromTasks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :example, :string
  end
end
