class AddTaskIdToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :task_id, :integer
  end
end
