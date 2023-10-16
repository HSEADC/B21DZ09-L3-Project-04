class RemoveTaskIdFromTasks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :task_id, :integer
  end
end
